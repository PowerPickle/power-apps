# Power apps

Mac apps from RKServicesPDX. This repository holds no code: only the list of apps
(`catalog.json`) and, under [Releases](https://github.com/PowerPickle/power-apps/releases),
the app downloads.

## The apps

| App | What it does |
| --- | --- |
| **Power Launcher** | Installs the Power apps, shows when updates are out, and opens files in the app that reads them |
| **Power3D** | 3D CAD: sketch, model and change parts, make drawings, and export them for 3D printing or machining |
| **PowerSlicer** | Slicer for filament (FDM) and resin printers: turns models into print files and sends them to your printer |
| **PowerScan** | 3D scanning with a supported scanner, handheld or on an optional turntable: clean up, measure and export meshes |
| **PowerPrint** | Watch and control 3D printers that run Klipper (Moonraker), OctoPrint, PrusaLink or Duet, or connect over USB, all in one window |
| **PowerCut** | Design, lay out and cut over USB on GRBL cutters, pen plotters and compatible machines running PowerCut firmware |

All need a Mac with macOS 26 or later (Apple silicon). They are early test versions.
You don't need any hardware to try them: every app that works with a machine has a demo
device.

## Install

**The easy way:** download `PowerLauncher.zip` from
[Releases](https://github.com/PowerPickle/power-apps/releases), open it, drag
**Power Launcher** to Applications and open it. Then install any of the other apps from
inside Power Launcher. It checks each download before installing it and shows when an
update is out. Updates install only when you click.

**One app at a time:** download any app's zip (for example `PowerSlicer.zip`) from
[Releases](https://github.com/PowerPickle/power-apps/releases), open it, and drag the app
to Applications.

## Support

Made by RKServicesPDX. Report problems from Help ▸ Report a Problem in any app, or email
support@rkservicespdx.com.

## Terms, privacy and security

- [Terms of Use](TERMS.md): one set for all the apps; free during the beta.
- [Privacy Policy](PRIVACY.md): no telemetry; your data stays on your Mac unless you
  connect a service yourself.
- [Security Policy](SECURITY.md): report security problems to support@rkservicespdx.com;
  we reply within 2 business days.

## For publishers

`catalog.json` is the app list Power Launcher reads (from
`https://raw.githubusercontent.com/PowerPickle/power-apps/main/catalog.json`). Each release
zip is uploaded to a GitHub release tagged `<app>-v<version>` and named `<App>.zip`.

To publish a release:

```bash
scripts/publish-release.sh powerslicer ~/Downloads/PowerSlicer.zip
```

It reads the version and identifier from the app in the zip, fills in `version`, `url`,
`sha256` and `size` in `catalog.json`, and prints the `gh release create` command to run.
An entry with an empty `sha256` is shown in Power Launcher as not available yet.
