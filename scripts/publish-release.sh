#!/bin/bash
# Prepare one app release for the public download repository.
#
# Usage: scripts/publish-release.sh <app> <zip>
#   <app>  catalog id (power3d, powerscan, powerslicer, powerprint, powercut)
#          or powerlauncher
#   <zip>  the release zip, with the .app at its top level
#
# It reads the version and bundle identifier from the app inside the zip, computes the
# zip's SHA-256 and size, updates catalog.json (version, url, sha256, size), and prints the
# `gh release create` command to run. It runs nothing on GitHub itself.
set -euo pipefail
REPO="PowerPickle/power-apps"
here="$(cd "$(dirname "$0")/.." && pwd)"
app="${1:?usage: publish-release.sh <app> <zip>}"
zip="${2:?usage: publish-release.sh <app> <zip>}"
[ -f "$zip" ] || { echo "no such file: $zip" >&2; exit 2; }
zip="$(cd "$(dirname "$zip")" && pwd)/$(basename "$zip")"

work="$(mktemp -d)"; trap 'rm -rf "$work"' EXIT
plist_path="$(/usr/bin/unzip -Z1 "$zip" | grep -E '^[^/]+\.app/Contents/Info\.plist$' | head -1 || true)"
[ -n "$plist_path" ] || { echo "the zip has no .app at its top level" >&2; exit 1; }
/usr/bin/unzip -p "$zip" "$plist_path" > "$work/Info.plist"
read_plist() { /usr/bin/plutil -extract "$1" raw -o - "$work/Info.plist" 2>/dev/null || true; }
version="$(read_plist CFBundleShortVersionString)"
bundle_id="$(read_plist CFBundleIdentifier)"
bundle="${plist_path%%/*}"
[ -n "$version" ] || { echo "the app in the zip has no version" >&2; exit 1; }
sha="$(/usr/bin/shasum -a 256 "$zip" | awk '{print $1}')"
size="$(/usr/bin/stat -f %z "$zip")"
asset="${bundle%.app}"; asset="${asset// /}.zip"
tag="${app}-v${version}"
url="https://github.com/${REPO}/releases/download/${tag}/${asset}"

if [ "$app" != "powerlauncher" ]; then
  /usr/bin/python3 - "$here/catalog.json" "$app" "$version" "$url" "$sha" "$size" "$bundle" "$bundle_id" <<'PY'
import json, sys
path, app, version, url, sha, size, bundle, bundle_id = sys.argv[1:]
with open(path) as f:
    catalog = json.load(f)
entry = next((a for a in catalog["apps"] if a["id"] == app), None)
if entry is None:
    sys.exit(f"{app} is not in catalog.json")
if entry["bundle"] != bundle:
    sys.exit(f"the zip holds {bundle}, but catalog.json expects {entry['bundle']}")
if entry.get("bundle_id") and entry["bundle_id"] != bundle_id:
    sys.exit(f"the app's identifier is {bundle_id}, but catalog.json expects {entry['bundle_id']}")
entry.update(version=version, url=url, sha256=sha, size=int(size))
if all(a.get("sha256") for a in catalog["apps"]):
    catalog.pop("todo", None)
with open(path + ".tmp", "w") as f:
    json.dump(catalog, f, indent=2)
    f.write("\n")
import os
os.replace(path + ".tmp", path)
PY
  echo "catalog.json: $app $version, sha256 $sha, $size bytes"
fi

cat <<CMD

Next (not run): upload the zip as a release, then commit and push catalog.json.

  dir=\$(mktemp -d) && cp "$zip" "\$dir/$asset"
  gh release create "$tag" "\$dir/$asset" --repo "$REPO" --title "${bundle%.app} $version" --notes "SHA-256: $sha"
  git -C "$here" commit -am "$app $version" && git -C "$here" push

The download address will be:
  $url
CMD
