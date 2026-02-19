#!/usr/bin/env bash

export PROFILE_NAME="Quiet"

export COLOR_01="#141414"           # Black (Host)
export COLOR_02="#C16262"           # Red (Syntax string)
export COLOR_03="#49B685"           # Green (Command)
export COLOR_04="#C5B76D"           # Yellow (Command second)
export COLOR_05="#4992B6"           # Blue (Path)
export COLOR_06="#815BBE"           # Magenta (Syntax var)
export COLOR_07="#41A4A4"           # Cyan (Prompt)
export COLOR_08="#C5C5C5"           # White

export COLOR_09="#505050"           # Bright Black
export COLOR_10="#ED5E7A"           # Bright Red (Command error)
export COLOR_11="#7ECE7E"           # Bright Green (Exec)
export COLOR_12="#DBDB70"           # Bright Yellow
export COLOR_13="#4DBFFF"           # Bright Blue (Folder)
export COLOR_14="#C067E4"           # Bright Magenta
export COLOR_15="#70DBD8"           # Bright Cyan
export COLOR_16="#F0F0F0"           # Bright White

export BACKGROUND_COLOR="#141414"   # Background
export FOREGROUND_COLOR="#B9B9B9"   # Foreground (Text)

export CURSOR_COLOR="#A0A0A0" # Cursor

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
