# Security Policy for the Power apps

> **Plain-language beta document.** RKServicesPDX wrote this policy in everyday words for
> the public beta. It has not been reviewed by a lawyer.

Last updated: October 18, 2026

## Reporting a problem

If you find a security problem in a Power app (Power Launcher, Power3D, PowerSlicer,
PowerScan, PowerPrint, PowerCut), its command-line tool or AI connection (MCP server), or
the update and download process, please email
**support@rkservicespdx.com** with "Security" in the subject.

Please include:

- the app and version (Help ▸ About & Credits), and your macOS version;
- what the problem is and what someone could do with it;
- steps to reproduce it, and any test files or proof-of-concept;
- whether you want to be credited, and how.

Please don't open a public GitHub issue for a security problem, and don't include other
people's personal data.

## What happens next

- **We reply within 2 business days** (US Pacific time) to confirm we got your report.
- We look into it, keep you updated, and tell you when a fix is released.
- We ask that you give us time to fix it before telling others: up to 90 days, or
  sooner once the fix is out. We will agree on a date with you.
- With your permission, we thank you by name in the release notes.

There is no paid bug bounty during the beta.

## Supported versions

Only the newest release of each app gets security fixes. Power Launcher tells you when an
update is available.

## In scope

- Anything that lets a person, a web page, a device, a file or a plugin do something the
  user didn't allow, for example: start, heat, move or cut a machine; switch a smart plug;
  read or change files; or get around the AI pairing and AI control switch.
- Secrets (keys, passwords, tokens) leaking from the Keychain, logs, problem reports or
  app files.
- Network services the apps start that can be reached by other users, other computers or
  web pages.
- Malicious or malformed files (3D models, G-code, scans, images, project files) or device
  replies that crash an app or run code.
- The update process: downloads that are not checked, or a way to swap an app for
  another program.

## Out of scope

- Plugins written by others. A plugin runs with your permissions by design; report
  problems in a plugin to its author. (Ways a plugin gets around the app's own limits
  are in scope.)
- AI services, GitHub, macOS and machine firmware made by other companies: please report
  those to their makers.
- Attacks that need physical access to an unlocked Mac, or social engineering.

## Testing safely

We will not take legal action against good-faith research that follows these rules:

- Test only on your own Mac and your own machines.
- Don't access, change or delete other people's data, and don't harm other people's
  devices or services.
- Never leave a machine you are testing with unattended while it can heat, move or cut.
- Stop and report as soon as you find a problem; don't keep using it.

## Contact

RKServicesPDX, Portland, Oregon, USA. Email: **support@rkservicespdx.com**.
The machine-readable version of this contact is in `.well-known/security.txt`.
