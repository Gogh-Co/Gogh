#!/usr/bin/env bash

export PROFILE_NAME="Warm Burnout Dark"

export COLOR_01="#23211B"           # Black (Host)
export COLOR_02="#F06B73"           # Red (Syntax string)
export COLOR_03="#70BF56"           # Green (Command)
export COLOR_04="#FDB04C"           # Yellow (Command second)
export COLOR_05="#4FBFFF"           # Blue (Path)
export COLOR_06="#D0A1FF"           # Magenta (Syntax var)
export COLOR_07="#93E2C8"           # Cyan (Prompt)
export COLOR_08="#C7C7C7"           # White

export COLOR_09="#686868"           # Bright Black
export COLOR_10="#F07178"           # Bright Red (Command error)
export COLOR_11="#AAD94C"           # Bright Green (Exec)
export COLOR_12="#FFB454"           # Bright Yellow
export COLOR_13="#59C2FF"           # Bright Blue (Folder)
export COLOR_14="#D2A6FF"           # Bright Magenta
export COLOR_15="#95E6CB"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#1A1510"   # Background
export FOREGROUND_COLOR="#BFBDB6"   # Foreground (Text)

export CURSOR_COLOR="#F5C56E" # Cursor

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
