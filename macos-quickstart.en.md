# Deploy XiotBox Runtime on macOS (Beginner Guide)

This guide gets you from zero to a running XiotBox Runtime on macOS with
**copy-paste commands**, including a free 30-day trial that is requested
automatically. All you need is the Terminal app.

## Step 0: Open Terminal

Press `Command + Space`, type "Terminal", and press Enter. Run every command
below in the Terminal.

## Step 1: Install Docker (first time only)

macOS does not ship with Docker. We use the lightweight `colima` solution
(command-line only, no windows popping up).

**If Homebrew is not installed yet**, run:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Then install the tools:

```sh
brew install colima docker docker-compose
brew install lima-additional-guestagents
```

> The second command is only needed on Apple Silicon (M1/M2/M3). If it fails on
> an Intel Mac, just skip it.

Start the Docker VM (drop `--arch x86_64` on Intel Macs):

```sh
colima start --arch x86_64 --vm-type qemu --cpu 2 --memory 4 --disk 20
```

Verify it worked (both commands should print a version):

```sh
docker version
docker compose version
```

If `docker compose` says "unknown command", run this and try again:

```sh
mkdir -p ~/.docker/cli-plugins && ln -sf /opt/homebrew/bin/docker-compose ~/.docker/cli-plugins/docker-compose
```

## Step 2: One-command Runtime deployment (free 30-day trial automatic)

```sh
curl -fsSL https://raw.githubusercontent.com/xiotbox/downloads/main/quickstart.sh | sh
```

The script downloads the latest release, verifies the SHA-256, generates a
configuration with random secrets, starts the service, and runs a health check.

You are done when you see output like:

```text
XiotBox Runtime 1.2.1 is up.
Runtime API URL : http://192.168.x.x:8020
SocketD address : tcp://192.168.x.x:9019
```

- **The 30-day trial is requested automatically** - no license key, no approval
- Note the `Runtime API URL` and the tokens in `.env`; you will enter them in
  your Odoo XiotBox settings

## Step 3: Confirm the trial (optional)

Open `http://localhost:8020/healthz` in a browser; `ok` means the service is
healthy. The trial license appears automatically in the xiotbox sales backend.

## Downloads are slow? (common outside GitHub-friendly networks)

The 50 MB bundle can be slow to fetch from GitHub. Pick one:

**Option 1: Use a proxy (fastest)**

If you have a proxy tool, find its local port (Clash usually `7890`, Surge
usually `1087`) and run:

```sh
export HTTPS_PROXY=http://127.0.0.1:7890
export HTTP_PROXY=http://127.0.0.1:7890
```

Then run the Step 2 command again.

**Option 2: Manual download (resume-friendly)**

Download both files from the Releases page:

```text
https://github.com/xiotbox/downloads/releases/latest
```

Fetch `XiotBoxRuntime-<version>-docker-amd64.tar.gz` and its `.sha256` sidecar,
then verify:

```sh
shasum -a 256 -c XiotBoxRuntime-<version>-docker-amd64.tar.gz.sha256
```

When it prints `OK`, extract the archive, copy `.env.lan.example` to `.env`,
replace the `CHANGE_ME` values with your LAN IP and random secrets, and run
`./install.sh`.

**Option 3: Just retry**

The script retries failed downloads (5 attempts). If the network is flaky, run
the same command again; nothing starts until the checksum verifies.

## Troubleshooting

| Symptom | Fix |
| --- | --- |
| `colima start` reports a missing guest agent | Run `brew install lima-additional-guestagents` |
| Ports 8020/9019 are occupied | Check `docker compose logs runtime`, or change the ports in `.env` |
| Health check fails | Run `docker compose logs --tail 50 runtime` and send us the log |
| Trial was not created | Make sure `https://license.xiotbox.com` is reachable |
| Stop the service | `cd xiotbox-runtime/XiotBoxRuntime-<version>-docker-amd64 && docker compose down` |

## Next steps

1. In your Odoo XiotBox settings, enter the `Runtime API URL` and the generated tokens
2. Install the desktop client patch (see the [downloads repository](https://github.com/xiotbox/downloads))
3. Print a test page

Questions: support@xiotbox.com
