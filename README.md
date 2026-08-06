# XiotBox Downloads

Public download hub for XiotBox products. Every archive is immutable, released
from an exact Git tag, and ships with a `.sha256` sidecar.

## macOS quickstart

- 中文：[macOS 快速部署教程（新手友好，含 Docker 安装）](macos-quickstart.md)
- English: [macOS Deployment Guide (beginner-friendly, incl. Docker)](macos-quickstart.en.md)

## XiotBox Runtime

Server-side companion for XiotBox Direct Print. One compiled service provides
the HTTP Runtime and embedded SocketD. The 30-day free trial is requested
automatically on first start (no license key needed).

**One-command install (Linux with Docker + Compose v2):**

```sh
curl -fsSL https://raw.githubusercontent.com/xiotbox/downloads/main/quickstart.sh | sh
```

Downloads the latest stable bundle, verifies the SHA-256, generates a LAN-mode
`.env` with random tokens, starts the Runtime, and prints the Runtime API URL
and SocketD address for your Odoo XiotBox settings.

**Latest stable:** `XiotBoxRuntime-1.2.0-docker-amd64.tar.gz`

| File | Checksum |
| --- | --- |
| `XiotBoxRuntime-1.2.0-docker-amd64.tar.gz` | see `.sha256` sidecar in the Release |

Full release history is in the Releases tab. Source repository:
[xiotbox/xiotbox-runtime](https://github.com/xiotbox/xiotbox-runtime).

## Desktop patch previews

Windows/macOS endpoint patch for PrintNode Client. Public preview releases use tags like `desktop-patch-v1.2.1-windows-preview`; formal artifacts continue through the entitled customer portal.

## Notes

- Anonymous downloads and resumable transfers are supported by GitHub Releases.
- Always verify the SHA-256 sidecar after download.
