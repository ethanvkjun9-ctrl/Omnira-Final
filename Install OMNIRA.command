#!/bin/zsh
set -euo pipefail

cd -- "$(dirname "$0")"

payload="./payload/OMNIRA-bin"
config_payload="./payload/opencode.json"
install_dir="$HOME/.local/share/omnira"
bin_dir="$HOME/.local/bin"
launcher="$bin_dir/OMNIRA"
config_dir="$HOME/.config/opencode"
config_file="$config_dir/opencode.json"

if [[ ! -x "$payload" ]]; then
  print -u2 "Installer payload is missing: $payload"
  exit 1
fi

mkdir -p "$install_dir" "$bin_dir" "$config_dir"
cp "$payload" "$install_dir/OMNIRA-bin"
chmod +x "$install_dir/OMNIRA-bin"

if [[ -f "$config_file" ]]; then
  cp "$config_file" "$config_file.backup.$(date +%Y%m%d%H%M%S)"
fi
cp "$config_payload" "$config_file"

cat > "$launcher" <<'LAUNCHER'
#!/bin/zsh

OMNIRA_BIN="$HOME/.local/share/omnira/OMNIRA-bin"

if [[ ! -x "$OMNIRA_BIN" ]]; then
  print -u2 "OMNIRA could not find $OMNIRA_BIN"
  exit 127
fi

for arg in "$@"; do
  case "$arg" in
  --help|-h)
    "$OMNIRA_BIN" "$@" 2>&1 | perl -CS -pe 's/opencode/OMNIRA/g; s/Opencode/OMNIRA/g; s/OpenCode/OMNIRA/g; s/OPENCODE/OMNIRA/g'
    exit ${pipestatus[1]}
    ;;
  esac
done

exec -a OMNIRA "$OMNIRA_BIN" "$@"
LAUNCHER
chmod +x "$launcher"

zshrc="$HOME/.zshrc"
path_line='export PATH="$HOME/.local/bin:$PATH"'
if [[ ! -f "$zshrc" ]] || ! grep -Fq "$path_line" "$zshrc"; then
  {
    print ""
    print "# Added by OMNIRA installer"
    print "$path_line"
  } >> "$zshrc"
fi

print ""
print "OMNIRA installed."
print "Command: $launcher"
print "Permission config: $config_file"
print ""
print "Open a new terminal tab, then run:"
print "  OMNIRA"
print ""
print "For macOS Full Disk Access, approve your Terminal app in:"
print "  System Settings > Privacy & Security > Full Disk Access"
print ""
print "Version check:"
"$launcher" --version
print ""
read -k 1 "?Press any key to close this installer."
