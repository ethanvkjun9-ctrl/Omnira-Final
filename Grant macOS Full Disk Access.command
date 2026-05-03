#!/bin/zsh
set -euo pipefail

print ""
print "macOS controls Full Disk Access. OMNIRA cannot grant it silently."
print ""
print "In the pane that opens, enable Full Disk Access for the terminal app you use to run OMNIRA:"
print -- "- Terminal"
print -- "- iTerm"
print -- "- Warp"
print -- "- VS Code"
print -- "- Codex, if you run OMNIRA from inside Codex"
print ""
print "After enabling it, fully quit and reopen that terminal app."
print ""
print "For opening/searching apps, OMNIRA can already use shell tools like:"
print "  open -a Safari"
print "  mdfind 'kMDItemKind == Application'"
print ""
print "For controlling apps with AppleScript/UI automation, also approve the same terminal app under:"
print "  Privacy & Security > Accessibility"
print "  Privacy & Security > Automation"
print ""

open "x-apple.systempreferences:com.apple.preference.security?Privacy_AllFiles"

read -k 1 "?Press any key to close this helper."
