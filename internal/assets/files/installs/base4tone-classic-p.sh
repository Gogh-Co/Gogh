#!/usr/bin/env bash

export PROFILE_NAME="Base4Tone Classic P"

export COLOR_01="#1c1d21"           # Black (Host)
export COLOR_02="#c039d5"           # Red (Syntax string)
export COLOR_03="#1398aa"           # Green (Command)
export COLOR_04="#3ccadd"           # Yellow (Command second)
export COLOR_05="#929ff7"           # Blue (Path)
export COLOR_06="#a57af0"           # Magenta (Syntax var)
export COLOR_07="#23b4c7"           # Cyan (Prompt)
export COLOR_08="#e8e8ee"           # White

export COLOR_09="#07080d"           # Bright Black
export COLOR_10="#db75eb"           # Bright Red (Command error)
export COLOR_11="#5ad2e2"           # Bright Green (Exec)
export COLOR_12="#a4e6ef"           # Bright Yellow
export COLOR_13="#d0d5fb"           # Bright Blue (Folder)
export COLOR_14="#b792f6"           # Bright Magenta
export COLOR_15="#c6cdfb"           # Bright Cyan
export COLOR_16="#f6f6f9"           # Bright White

export BACKGROUND_COLOR="#1c1d21"   # Background
export FOREGROUND_COLOR="#9092a2"   # Foreground (Text)

export CURSOR_COLOR="#6a878a" # Cursor

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
