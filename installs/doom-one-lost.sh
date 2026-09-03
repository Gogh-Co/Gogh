#!/usr/bin/env bash

export PROFILE_NAME="Doom One Lost"

export COLOR_01="#1B2229"           # Black (Host)
export COLOR_02="#FF6C6B"           # Red (Syntax string)
export COLOR_03="#98BE65"           # Green (Command)
export COLOR_04="#ECBE7B"           # Yellow (Command second)
export COLOR_05="#2257A0"           # Blue (Path)
export COLOR_06="#A9A1E1"           # Magenta (Syntax var)
export COLOR_07="#5699AF"           # Cyan (Prompt)
export COLOR_08="#5B6268"           # White

export COLOR_09="#3F444A"           # Bright Black
export COLOR_10="#DA8548"           # Bright Red (Command error)
export COLOR_11="#4DB5BD"           # Bright Green (Exec)
export COLOR_12="#ECBE7B"           # Bright Yellow
export COLOR_13="#51AFEF"           # Bright Blue (Folder)
export COLOR_14="#C678DD"           # Bright Magenta
export COLOR_15="#46D9FF"           # Bright Cyan
export COLOR_16="#BBC2CF"           # Bright White

export BACKGROUND_COLOR="#21242B"   # Background
export FOREGROUND_COLOR="#5B6268"   # Foreground (Text)

export CURSOR_COLOR="#5B6268" # Cursor

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
