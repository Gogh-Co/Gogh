#!/usr/bin/env bash

export PROFILE_NAME="Dracula"

export COLOR_01="#262626"           # Black (Host)
export COLOR_02="#E64747"           # Red (Syntax string)
export COLOR_03="#42E66C"           # Green (Command)
export COLOR_04="#E4F34A"           # Yellow (Command second)
export COLOR_05="#9B6BDF"           # Blue (Path)
export COLOR_06="#E356A7"           # Magenta (Syntax var)
export COLOR_07="#75D7EC"           # Cyan (Prompt)
export COLOR_08="#F8F8F2"           # White

export COLOR_09="#7A7A7A"           # Bright Black
export COLOR_10="#FF5555"           # Bright Red (Command error)
export COLOR_11="#50FA7B"           # Bright Green (Exec)
export COLOR_12="#F1FA8C"           # Bright Yellow
export COLOR_13="#BD93F9"           # Bright Blue (Folder)
export COLOR_14="#FF79C6"           # Bright Magenta
export COLOR_15="#8BE9FD"           # Bright Cyan
export COLOR_16="#F9F9FB"           # Bright White

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
