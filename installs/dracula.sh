#!/usr/bin/env bash

export PROFILE_NAME="Dracula"

export COLOR_01="#21222C"           # Black (Host)
export COLOR_02="#FF5555"           # Red (Syntax string)
export COLOR_03="#50FA7B"           # Green (Command)
export COLOR_04="#F1FA8C"           # Yellow (Command second)
export COLOR_05="#BD93F9"           # Blue (Path)
export COLOR_06="#FF79C6"           # Magenta (Syntax var)
export COLOR_07="#8BE9FD"           # Cyan (Prompt)
export COLOR_08="#F8F8F2"           # White

export COLOR_09="#6272A4"           # Bright Black
export COLOR_10="#FF6E6E"           # Bright Red (Command error)
export COLOR_11="#69FF94"           # Bright Green (Exec)
export COLOR_12="#FFFFA5"           # Bright Yellow
export COLOR_13="#D6ACFF"           # Bright Blue (Folder)
export COLOR_14="#FF92DF"           # Bright Magenta
export COLOR_15="#A4FFFF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#282A36"   # Background
export FOREGROUND_COLOR="#F8F8F2"   # Foreground (Text)

export CURSOR_COLOR="#F8F8F2" # Cursor

apply_theme() {
    if [[ -e "${GOGH_APPLY_SCRIPT}" ]]; then
      bash "${GOGH_APPLY_SCRIPT}"
    elif [[ -e "${PARENT_PATH}/apply-colors.sh" ]]; then
      bash "${PARENT_PATH}/apply-colors.sh"
    elif [[ -e "${SCRIPT_PATH}/apply-colors.sh" ]]; then
      bash "${SCRIPT_PATH}/apply-colors.sh"
    else
      printf '\n%s\n' "Error: Couldn't find apply-colors.sh" 1>&2
      exit 1
    fi
}

# | ===========================================================================
# | Apply Colors
# | ===========================================================================
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

if [ -z "${GOGH_NONINTERACTIVE+no}" ]; then
    apply_theme
else
    apply_theme 1>/dev/null
fi
