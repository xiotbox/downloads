#!/bin/sh
set -eu

# XiotBox Runtime one-command experience install (automatic 30-day free trial).
#
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/xiotbox/downloads/main/quickstart.sh | sh
#
# Environment overrides:
#   XIOTBOX_RUNTIME_VERSION  pin an exact version (default: latest stable)
#   XIOTBOX_LAN_IP           LAN IP advertised to clients (default: auto-detect)
#   XIOTBOX_RUNTIME_DIR      install directory (default: ./xiotbox-runtime)

BASE_URL="${XIOTBOX_RELEASES_BASE:-https://github.com/xiotbox/downloads/releases/download}"
MANIFEST_URL="${XIOTBOX_MANIFEST_URL:-https://license.xiotbox.com/runtime/stable.json}"
LICENSE_PUBLIC_KEY="${XIOTBOX_LICENSE_PUBLIC_KEY:-8HAp5t1JTZu7k8zrQKXqs0nm48icU3ruWVr3I/F5GVM=}"
DEST="${XIOTBOX_RUNTIME_DIR:-./xiotbox-runtime}"

say() { printf '%s\n' "$*"; }
fail() { printf 'ERROR: %s\n' "$*" >/dev/stderr; exit 1; }

command -v docker >/dev/null 2>&1 || fail "Docker is required. See https://docs.docker.com/engine/install/"
docker compose version >/dev/null 2>&1 || fail "Docker Compose v2 is required."

# Resolve the latest stable version from the public manifest.
version="${XIOTBOX_RUNTIME_VERSION:-}"
if [ -z "$version" ]; then
    say "Resolving the latest Runtime version from $MANIFEST_URL ..."
    manifest=$(curl -fsSL --max-time 20 "$MANIFEST_URL") \
        || fail "Cannot reach the XiotBox License Service. Check outbound HTTPS access."
    version=$(printf '%s' "$manifest" | sed -n 's/.*"version"[[:space:]]*:[[:space:]]*"\([0-9][0-9.]*\)".*/\1/p' | head -1)
fi
[ -n "$version" ] || fail "Could not resolve a Runtime version."
case "$version" in
    [0-9]*.[0-9]*.[0-9]*) ;;
    *) fail "Invalid Runtime version: $version" ;;
esac

bundle="XiotBoxRuntime-${version}-docker-amd64.tar.gz"
url="$BASE_URL/v${version}/$bundle"

mkdir -p "$DEST"
cd "$DEST"

say "Downloading $bundle ..."
curl -fL --retry 5 --retry-delay 2 --connect-timeout 20 -o "$bundle" "$url" \
    || fail "Download failed for $url"
curl -fLs --retry 5 --connect-timeout 20 -o "$bundle.sha256" "$url.sha256" \
    || fail "Download failed for $url.sha256"

expected=$(awk '{print $1}' "$bundle.sha256")
actual=$(sha256sum "$bundle" | awk '{print $1}')
[ -n "$expected" ] && [ "$expected" = "$actual" ] \
    || fail "SHA-256 mismatch. Re-run to retry the download."
say "Checksum verified: $actual"

tar -xzf "$bundle"
dir="XiotBoxRuntime-${version}-docker-amd64"
[ -d "$dir" ] || fail "Unexpected archive layout (missing $dir)."
cd "$dir"
[ -f .env.lan.example ] || fail "Bundle is missing .env.lan.example."

# Detect the primary LAN IPv4 address.
lan_ip="${XIOTBOX_LAN_IP:-}"
if [ -z "$lan_ip" ]; then
    lan_ip=$(hostname -I 2>/dev/null | awk '{print $1}' | grep -E '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$' || true)
fi
if [ -z "$lan_ip" ]; then
    lan_ip=$(ip route get 1.1.1.1 2>/dev/null | sed -n 's/.*src \([0-9.]*\).*/\1/p' | head -1 || true)
fi
[ -n "$lan_ip" ] || lan_ip="127.0.0.1"

rand() { od -An -N16 -tx1 /dev/urandom 2>/dev/null | tr -d ' \n' || printf '%s' "$$$(date +%s)"; }
db="xiotbox_trial_$(rand | cut -c1-8)"
rt_token=$(rand)
sock_token=$(rand)
mgmt_token=$(rand)
server_id="trial-$(rand | cut -c1-8)"

sed -e "s|CHANGE_ME_LAN_IP|$lan_ip|g" \
    -e "s|CHANGE_ME_DATABASE|$db|g" \
    -e "s|CHANGE_ME_RUNTIME_TOKEN|$rt_token|g" \
    -e "s|CHANGE_ME_SOCKETD_TOKEN|$sock_token|g" \
    -e "s|CHANGE_ME_MANAGEMENT_TOKEN|$mgmt_token|g" \
    -e "s|CHANGE_ME_CUSTOMER_SERVER_ID|$server_id|g" \
    -e "s|CHANGE_ME_ED25519_PUBLIC_KEY|$LICENSE_PUBLIC_KEY|g" \
    .env.lan.example > .env

say "Generated .env with random tokens (LAN mode, TLS off)."
say "Starting Runtime ..."
./install.sh

say ""
say "================================================================"
say " XiotBox Runtime $version is up."
say ""
say "   Runtime API URL : http://$lan_ip:8020"
say "   SocketD address : tcp://$lan_ip:9019"
say "   Status page    : http://$lan_ip:8020/status"
say ""
say " The 30-day free trial is requested automatically on first start."
say " Next: in your Odoo XiotBox settings, enter the Runtime API URL"
say " and the generated tokens from $PWD/.env"
say "================================================================"
