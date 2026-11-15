#!/usr/bin/env bash
# Launch the game on the codespace's virtual desktop (noVNC, port 6080).
# Runs automatically on every codespace start; safe to run again by hand.
export DISPLAY=:1
export WINEPREFIX="$HOME/.wine"
export WINEDLLOVERRIDES="mscoree,mshtml="   # skip Mono/Gecko install prompts

if [ ! -f "$HOME/game/RR4.exe" ]; then
  echo "RR4.exe not found in $HOME/game - setup did not finish. See $HOME/setup.log"
  exit 0
fi
if ! command -v wine >/dev/null; then
  echo "wine is not installed - setup did not finish. See $HOME/setup.log"
  exit 0
fi
if pgrep -f RR4.exe >/dev/null; then
  echo "RR4.exe is already running"
  exit 0
fi

cd "$HOME/game"
nohup wine RR4.exe > "$HOME/wine.log" 2>&1 &
echo "started RR4.exe (log: $HOME/wine.log)"
echo "open the Ports tab and click the globe next to port 6080 (password: vscode)"
