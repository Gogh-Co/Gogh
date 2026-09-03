#!/usr/bin/env bash

export PROFILE_NAME="Pierre Light"

export COLOR_01="#1F1F21"           # Black (Host)
export COLOR_02="#D52C36"           # Red (Syntax string)
export COLOR_03="#1D8138"           # Green (Command)
export COLOR_04="#AC8816"           # Yellow (Command second)
export COLOR_05="#216CAB"           # Blue (Path)
export COLOR_06="#A631BE"           # Magenta (Syntax var)
export COLOR_07="#2182A1"           # Cyan (Prompt)
export COLOR_08="#79797F"           # White

export COLOR_09="#8E8E95"           # Bright Black
export COLOR_10="#FF2E3F"           # Bright Red (Command error)
export COLOR_11="#0DBE4E"           # Bright Green (Exec)
export COLOR_12="#D5A910"           # Bright Yellow
export COLOR_13="#009FFF"           # Bright Blue (Folder)
export COLOR_14="#C635E4"           # Bright Magenta
export COLOR_15="#08C0EF"           # Bright Cyan
export COLOR_16="#DBDBDD"           # Bright White

export BACKGROUND_COLOR="#FFFFFF"   # Background
export FOREGROUND_COLOR="#070707"   # Foreground (Text)

export CURSOR_COLOR="#009FFF" # Cursor

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
