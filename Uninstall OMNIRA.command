#!/bin/zsh
set -euo pipefail

rm -f "$HOME/.local/bin/OMNIRA"
rm -rf "$HOME/.local/share/omnira"

print ""
print "OMNIRA uninstalled."
print "Note: this leaves your shell PATH alone, since ~/.local/bin may be used by other tools."
print ""
read -k 1 "?Press any key to close this uninstaller."
