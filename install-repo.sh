#!/data/data/com.termux/files/usr/bin/bash
# File       : install-repo.sh
# Author     : luisadha
# Create date:  15-Jun-2026 
# Get some needed tools. coreutils for mkdir command, gnugp for the signing key, and apt-transport-https to actually connect to the repo
set -e

pkg install -y wget gnupg

mkdir -p $PREFIX/etc/apt/sources.list.d
mkdir -p $PREFIX/etc/apt/trusted.gpg.d

REPO_FILE="$PREFIX/etc/apt/sources.list.d/luisadha.list"
KEY_FILE="$PREFIX/etc/apt/trusted.gpg.d/luisadha-dev.gpg"

if [ ! -f "$REPO_FILE" ]; then
    echo "deb https://repo.luisadha.dev/ stable main" > "$REPO_FILE"

    wget -qO- https://repo.luisadha.dev/luisadha-dev.gpg \
        | gpg --dearmor > "$KEY_FILE"

    apt update
else
    echo "repo already installed"
fi
