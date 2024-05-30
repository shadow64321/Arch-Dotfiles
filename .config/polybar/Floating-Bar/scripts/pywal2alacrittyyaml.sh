#!/bin/sh
# Alacritty Color Export
# Version 0.1.1
# github.com/egeesin
#
# Exports generated Wal colors to Alacritty config
# WARNING: Don't forget to backup your Alacritty config
# before execute this script!
#
# Dependencies: grep, sed
# Usage: ./script.sh
#        ./script.sh <config yml>

# Function to display error and quit
die() {
  printf "ERR: %s\n" "$1" >&2
  exit 1
}

DEFAULT_MACOS_CONFIG="$HOME"/.config/alacritty/alacritty.yml

# Wal generates a shell script that defines color0..color15
SRC="$HOME"/.cache/wal/colors.sh

[ -e "$SRC" ] || die "Wal colors not found, exiting script. Have you executed Wal before?"
printf "Colors found, source ready.\n"

READLINK=$( command -v greadlink || command -v readlink )

# Get config file
if [ -n "$1" ]; then
  [ -e "$1" ] || die "Selected config doesn't exist, exiting script."
  printf "Config found, destination ready.\n"
  CFG=$1
  [ -L "$1" ] && {
    printf "Following symlink to config...\n"
    CFG=$($READLINK -f "$1")
  }
else
  # Default config path in Mac systems
  [ -e "$DEFAULT_MACOS_CONFIG" ] || die "Alacritty config not found, exiting script."

  CFG="$DEFAULT_MACOS_CONFIG"
  [ -L "$DEFAULT_MACOS_CONFIG" ] && {
    printf "Following symlink to config...\n"
    CFG=$($READLINK -f "$DEFAULT_MACOS_CONFIG")
  }
fi

# Get hex colors from Wal cache
# No need for shellcheck to check this, it comes from pywal
# shellcheck disable=SC1090
. "$SRC"

# Create temp file for sed results
tempfile=$(mktemp)
trap 'rm $tempfile' INT TERM EXIT

# Delete existing color declarations generated by this script
# If begin comment exists
if grep -q '^# BEGIN ACE' "$CFG"; then
  # And if end comment exists
  if grep -q '^# END ACE' "$CFG"; then
    # Delete contents of the block
    printf "Existing generated colors found, replacing new colors...\n"
    sed '/^# BEGIN ACE/,/^# END ACE/ {
      /^# BEGIN ACE/! { /^# END ACE/!d; }
    }' "$CFG" > "$tempfile" \
      && cat "$tempfile" > "$CFG"
  # If no end comment, don't do anything
  else
    die "No '# END ACE' comment found, please ensure it is present."
  fi
# If no begin comment found
else
  # Don't do anything and notify user if there's an end comment in the file
  ! grep -q '^# END ACE' "$CFG" || die "Found '# END ACE' comment, but no '# BEGIN ACE' comment found. Please ensure it is present."
  printf "There's no existing 'generated' colors, adding comments...\n";
  printf '# BEGIN ACE\n# END ACE' >> "$CFG";
fi

# Write new color definitions
# We know $colorX is unset, we set it by sourcing above
# shellcheck disable=SC2154

# rm $HOME/.config/alacritty/alacritty.yml

{ sed "/^# BEGIN ACE/ r /dev/stdin" "$CFG" > "$tempfile" <<EOF
window:
  padding:
    x: 5
    y: 5
  class:
    instance: Alacritty
    general: Alacritty
  opacity: 0.7

scrolling:
  history: 10000
  multiplier: 3

font:
  normal:
    family: FiraCode Nerd Font
    style: Medium
  bold:
    family: FiraCode Nerd Font
    style: Bold
  italic:
    family: FiraCode Nerd Font
    style: MediumItalic
  bold_italic:
    family: FiraCode Nerd Font
    style: BoldItalic
  size: 11
draw_bold_text_with_bright_colors: true

#colors:
#    primary:
#        background: "#1E1E2E" # base
#        foreground: "#CDD6F4" # text
#        # Bright and dim foreground colors
#        dim_foreground: "#CDD6F4" # text
#        bright_foreground: "#CDD6F4" # text
#
#    # Cursor colors
#    cursor:
#        text: "#1E1E2E" # base
#        cursor: "#F5E0DC" # rosewater
#    vi_mode_cursor:
#        text: "#1E1E2E" # base
#        cursor: "#B4BEFE" # lavender
#
#    # Search colors
#    search:
#        matches:
#            foreground: "#1E1E2E" # base
#            background: "#A6ADC8" # subtext0
#        focused_match:
#            foreground: "#1E1E2E" # base
#            background: "#A6E3A1" # green
#        footer_bar:
#            foreground: "#1E1E2E" # base
#            background: "#A6ADC8" # subtext0
#
#    # Keyboard regex hints
#    hints:
#        start:
#            foreground: "#1E1E2E" # base
#            background: "#F9E2AF" # yellow
#        end:
#            foreground: "#1E1E2E" # base
#            background: "#A6ADC8" # subtext0
#
#    # Selection colors
#    selection:
#        text: "#1E1E2E" # base
#        background: "#F5E0DC" # rosewater
#
#    # Normal colors
#    normal:
#        black: "#45475A" # surface1
#        red: "#F38BA8" # red
#        green: "#A6E3A1" # green
#        yellow: "#F9E2AF" # yellow
#        blue: "#89B4FA" # blue
#        magenta: "#F5C2E7" # pink
#        cyan: "#94E2D5" # teal
#        white: "#BAC2DE" # subtext1
#
#    # Bright colors
#    bright:
#        black: "#585B70" # surface2
#        red: "#F38BA8" # red
#        green: "#A6E3A1" # green
#        yellow: "#F9E2AF" # yellow
#        blue: "#89B4FA" # blue
#        magenta: "#F5C2E7" # pink
#        cyan: "#94E2D5" # teal
#        white: "#A6ADC8" # subtext0
#
#    # Dim colors
#    dim:
#        black: "#45475A" # surface1
#        red: "#F38BA8" # red
#        green: "#A6E3A1" # green
#        yellow: "#F9E2AF" # yellow
#        blue: "#89B4FA" # blue
#        magenta: "#F5C2E7" # pink
#        cyan: "#94E2D5" # teal
#        white: "#BAC2DE" # subtext1
#
#    indexed_colors:
#        - { index: 16, color: "#FAB387" }
#        - { index: 17, color: "#F5E0DC" }
#
#key_bindings:
#  - { key: Return, mods: Super|Shift, action: SpawnNewInstance }

colors:
  primary:
    background: '$color0'
    foreground: '$color7'
  cursor:
    text:       '$color0'
    cursor:     '$color7'
  normal:
    black:      '$color0'
    red:        '$color1'
    green:      '$color2'
    yellow:     '$color3'
    blue:       '$color4'
    magenta:    '$color5'
    cyan:       '$color6'
    white:      '$color7'
  bright:
    black:      '$color8'
    red:        '$color9'
    green:      '$color10'
    yellow:     '$color11'
    blue:       '$color12'
    magenta:    '$color13'
    cyan:       '$color14'
    white:      '$color15'
EOF
} && cat "$tempfile" > "$CFG" \
  && rm "$tempfile"
trap - INT TERM EXIT
printf "'%s' exported to '%s'\n" "$SRC" "$CFG"