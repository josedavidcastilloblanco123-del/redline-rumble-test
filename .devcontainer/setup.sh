#!/usr/bin/env bash
# Runs inside the Codespace only. Installs Wine and fetches the game INTO the
# codespace (outside the repo folder), so the .exe is never committed or
# published and never touches your own computer.
set -euxo pipefail

sudo dpkg --add-architecture i386
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  wine wine32:i386 wine64 fonts-wine unzip python3-pip

sudo pip3 install --break-system-packages gdown

mkdir -p "$HOME/game"
cd "$HOME/game"
gdown "https://drive.google.com/uc?id=1nEmQfVV08R2RB-JhHdhHmoEiewLVA0tk" -O game.zip
unzip -j -o game.zip "redlinerumble4/RR4.exe" -d .
rm -f game.zip
ls -l "$HOME/game"
