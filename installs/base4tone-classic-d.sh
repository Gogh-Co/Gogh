#!/usr/bin/env bash

export PROFILE_NAME="Base4Tone Classic D"

export COLOR_01="#21211C"           # Black (Host)
export COLOR_02="#049582"           # Red (Syntax string)
export COLOR_03="#DA6B2B"           # Green (Command)
export COLOR_04="#EE9968"           # Yellow (Command second)
export COLOR_05="#CFB617"           # Blue (Path)
export COLOR_06="#82C115"           # Magenta (Syntax var)
export COLOR_07="#E6854D"           # Cyan (Prompt)
export COLOR_08="#EEEDE8"           # White

export COLOR_09="#0D0C07"           # Bright Black
export COLOR_10="#1CC4AE"           # Bright Red (Command error)
export COLOR_11="#F0A57A"           # Bright Green (Exec)
export COLOR_12="#F5C1A3"           # Bright Yellow
export COLOR_13="#F6EDB1"           # Bright Blue (Folder)
export COLOR_14="#95DC18"           # Bright Magenta
export COLOR_15="#F2E58C"           # Bright Cyan
export COLOR_16="#F9F8F6"           # Bright White

export BACKGROUND_COLOR="#21211C"   # Background
export FOREGROUND_COLOR="#A2A090"   # Foreground (Text)

export CURSOR_COLOR="#85776F" # Cursor

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
