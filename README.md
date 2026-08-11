<div align="center">

<img src="logo.png" alt="XiotBox" width="120" />

# XiotBox

**Self-hosted Cloud Printing Platform**

[Website](https://www.xiotbox.com) · [Live Demo](https://demo.xiotbox.com) · [Odoo Apps](https://apps.odoo.com/apps/browse?repo_maintainer_id=500439)

**English** | [简体中文](README.zh-CN.md) | [日本語](README.ja-JP.md) | [Français](README.fr-FR.md)

</div>

## What is XiotBox?

XiotBox is a **self-hosted cloud printing platform** compatible with the
PrintNode client protocol. All printing data stays on your own servers — no
third-party cloud dependency, full control over your infrastructure.

| Component | Description | Pricing |
| --- | --- | --- |
| XiotBox Lite | Free Odoo 19 modules for direct printing | Free |
| XiotBox Runtime | Server-side runtime (HTTP API + embedded SocketD) | Subscription — **automatic 30-day trial on first deploy** |
| Desktop Patch | PrintNode client endpoint patch (Windows/macOS) | Free |

All Odoo modules are free. Runtime is the only subscription item, and the
30-day trial is granted automatically on first deployment — no sign-up, no
approval.

## Quick start

One-command deployment (Linux, requires Docker + Compose v2):

```sh
curl -fsSL https://raw.githubusercontent.com/xiotbox/downloads/main/quickstart.sh | sh
```

Beginner guides:

- English: [macOS Deployment Guide (incl. Docker install)](macos-quickstart.en.md)

## Key features

- **PrintNode client compatible** — the same client keeps working, pointed at your own Runtime
- **One compiled service** — HTTP Runtime and embedded SocketD in a single container
- **Automatic trial** — free 30-day trial issued on first start, no license key required
- **End-to-end transport encryption** — Ed25519 / X25519 signed token flow
- **Device management** — per-user printer visibility, online status, and print jobs
- **Hardened container** — non-root user, all capabilities dropped, read-only root filesystem

## Downloads

Every release artifact is built from an exact Git tag, is immutable, and ships
with a `.sha256` sidecar. Anonymous downloads and resumable transfers are
supported.

| Artifact | Where |
| --- | --- |
| XiotBox Runtime (Docker amd64) | Releases — `XiotBoxRuntime-<version>-docker-amd64.tar.gz` |
| XiotBox Client (Windows x86-64) | Releases — `XiotBoxClient-<version>-windows-x86_64.zip` |
| Desktop Patch previews (Windows) | Releases — `desktop-patch-*` tags |
| SHA-256 verification | `.sha256` sidecar in every Release |

Verify:

```sh
shasum -a 256 -c XiotBoxRuntime-<version>-docker-amd64.tar.gz.sha256
```

## Links & support

- Website: https://www.xiotbox.com
- Live demo: https://demo.xiotbox.com
- Odoo Apps: https://apps.odoo.com/apps/browse?repo_maintainer_id=500439
- Support: support@xiotbox.com
