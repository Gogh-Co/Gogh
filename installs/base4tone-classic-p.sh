#!/usr/bin/env bash

export PROFILE_NAME="Base4Tone Classic P"

export COLOR_01="#1C1D21"           # Black (Host)
export COLOR_02="#C039D5"           # Red (Syntax string)
export COLOR_03="#1398AA"           # Green (Command)
export COLOR_04="#3CCADD"           # Yellow (Command second)
export COLOR_05="#929FF7"           # Blue (Path)
export COLOR_06="#A57AF0"           # Magenta (Syntax var)
export COLOR_07="#23B4C7"           # Cyan (Prompt)
export COLOR_08="#E8E8EE"           # White

export COLOR_09="#07080D"           # Bright Black
export COLOR_10="#DB75EB"           # Bright Red (Command error)
export COLOR_11="#5AD2E2"           # Bright Green (Exec)
export COLOR_12="#A4E6EF"           # Bright Yellow
export COLOR_13="#D0D5FB"           # Bright Blue (Folder)
export COLOR_14="#B792F6"           # Bright Magenta
export COLOR_15="#C6CDFB"           # Bright Cyan
export COLOR_16="#F6F6F9"           # Bright White

export BACKGROUND_COLOR="#1C1D21"   # Background
export FOREGROUND_COLOR="#9092A2"   # Foreground (Text)

export CURSOR_COLOR="#6A878A" # Cursor

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
