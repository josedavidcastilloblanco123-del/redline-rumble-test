#!/usr/bin/env bash
# Launch the game on the codespace's virtual desktop (noVNC, port 6080).
export DISPLAY=:1
export WINEARCH=win32
export WINEPREFIX="$HOME/.wine"
export WINEDLLOVERRIDES="mscoree,mshtml="   # skip Mono/Gecko install prompts
cd "$HOME/game"
nohup wine RR4.exe > "$HOME/wine.log" 2>&1 &
echo "started RR4.exe (log: $HOME/wine.log)"
