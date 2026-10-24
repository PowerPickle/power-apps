# Privacy Policy for the Power apps

> **Plain-language beta document.** RKServicesPDX wrote this policy in everyday words for
> the public beta. It has not been reviewed by a lawyer.

Last updated: October 18, 2026

This policy covers every Power app from RKServicesPDX ("RKS", "we", "us"): Power Launcher,
Power3D, PowerSlicer, PowerScan, PowerPrint and PowerCut, with their command-line tools
and AI connections (MCP servers).

## The short version

- **No telemetry.** The apps have no analytics, tracking, advertising or crash reporting
  that sends anything on its own. There are no accounts with us.
- **Your data stays on your Mac** unless you connect a service yourself. We never receive
  your files, designs, scans, print jobs or photos.
- **AI only when you connect it.** Nothing goes to an AI service unless you connected that
  service yourself.
- **Problem reports only when you send them,** cleaned first, and you see exactly what is
  sent.
- **We don't sell or share** anything about you.

## What stays on your Mac

Everything you make or record in the apps: 3D models, scans and meshes, slicing projects
and G-code, print and cut jobs, cut designs, photos, device lists and app settings. Each
app keeps its files in your user folder (usually `~/Library/Application Support/<app name>`)
or wherever you save them.

Passwords, API keys and sign-in tokens are kept in the macOS Keychain, never in plain
settings files.

## When something leaves your Mac

The apps only connect to other computers in these cases:

| Connection | When | What is sent |
| --- | --- | --- |
| GitHub (github.com and its download servers) | Power Launcher checks for the app list and updates, and when you download an app or update | An ordinary web request. GitHub sees your IP address, as for any website. No ID or account of ours is sent. |
| An AI service you connected (for example Anthropic, or OpenAI and other OpenAI-compatible services) | Only when you use an AI feature | What that feature needs, for example the question you asked and the file or settings it is about. Apple Intelligence and models on your own computer (such as Ollama or LM Studio at a local address) keep it on your device. |
| An AI app on your Mac, such as Claude (MCP) | When that AI app asks | Until you allow (pair) it in Power Launcher or a Power app, it sees only basic status. After that it can read what its request needs. Running machines or writing files outside the app's own folders also needs AI control turned on in Settings. What the AI app does with it is covered by its own policy. |
| Your own machines and devices | When you connect them | Commands and files for that machine (printers, cameras, cutters, scanners, turntables, smart plugs), usually on your own network, USB or Bluetooth. |
| Plugins you install | Whenever the plugin decides | A plugin is a normal program and can use the network. We don't control plugins written by others. |

Each AI service, website, or plugin author has their own privacy policy for what they
receive.

## Problem reports

Help ▸ Report a Problem builds a short report: the app and its version, your macOS
version, a description you write, and (in most apps) the last lines of the app's log.
Before you send it, the app takes out your home folder and user name, IP addresses, and
long strings that look like a key, token or serial number. You see the cleaned report and can change it, so read it first:
anything you type yourself is sent as you wrote it. Nothing is sent unless you choose **Email
support** (it opens your own email app, so you send it yourself) or copy it and send it
some other way.

## When you email us

If you email support@rkservicespdx.com, we receive your email address and whatever you
send. We use it only to answer you and fix problems. We don't add you to a mailing list
or share your email. We delete support emails when they are no longer needed, and you can
ask us to delete yours at any time.

## Children

The apps are not made for children under 13, and we don't knowingly collect anything
from them. Since the apps send us nothing on their own, there is nothing for us to
collect.

## Your choices

- Disconnect any AI service in the app's settings, and unpair AI apps at any time.
- Delete an app and its folder in `~/Library/Application Support` to remove its data.
- Ask us what we hold about you (normally just support emails) or to delete it, by
  emailing support@rkservicespdx.com.

## Changes

If the apps ever start collecting anything, or if we add ads or paid features that change
this, we will update this policy first and say so in the release notes. The current
version is always at <https://github.com/PowerPickle/power-apps/blob/main/PRIVACY.md>.

## Contact

RKServicesPDX, Portland, Oregon, USA. Email: **support@rkservicespdx.com**.
