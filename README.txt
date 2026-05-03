OMNIRA Installer

Double-click "Install OMNIRA.command" to install the OMNIRA terminal command.

What it installs:
- ~/.local/share/omnira/OMNIRA-bin
- ~/.local/bin/OMNIRA
- ~/.config/opencode/opencode.json

After installing, open a new terminal tab and run:

  OMNIRA

OMNIRA is configured with permissive tool access:
- all OMNIRA/OpenCode tool permissions set to allow
- external directory access allowed
- .env reads allowed
- repeated tool-call guard allowed

macOS Full Disk Access is separate. To give OMNIRA true machine-level file visibility, give Full Disk Access to the terminal app that launches OMNIRA. You can use "Grant macOS Full Disk Access.command" to open the right Settings pane.

To remove it, double-click "Uninstall OMNIRA.command".

This installer uses the current OMNIRA rebrand of Opencode 1.14.20 and keeps the fast direct launcher, so keyboard input does not go through the older Python proxy.
