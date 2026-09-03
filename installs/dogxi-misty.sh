#!/usr/bin/env bash

export PROFILE_NAME="Dogxi Misty"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#EC675E"           # Red (Syntax string)
export COLOR_03="#A6E173"           # Green (Command)
export COLOR_04="#E6BF7B"           # Yellow (Command second)
export COLOR_05="#ACEAFB"           # Blue (Path)
export COLOR_06="#ED73BE"           # Magenta (Syntax var)
export COLOR_07="#82DBEB"           # Cyan (Prompt)
export COLOR_08="#F1F1F0"           # White

export COLOR_09="#686868"           # Bright Black
export COLOR_10="#EC675E"           # Bright Red (Command error)
export COLOR_11="#A6E173"           # Bright Green (Exec)
export COLOR_12="#E8C88A"           # Bright Yellow
export COLOR_13="#ACEAFB"           # Bright Blue (Folder)
export COLOR_14="#ED73BE"           # Bright Magenta
export COLOR_15="#9CDEEE"           # Bright Cyan
export COLOR_16="#F1F1F0"           # Bright White

export BACKGROUND_COLOR="#282A35"   # Background
export FOREGROUND_COLOR="#EFF0EB"   # Foreground (Text)

export CURSOR_COLOR="#EAEAEA" # Cursor

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
