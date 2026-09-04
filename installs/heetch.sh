#!/usr/bin/env bash

export PROFILE_NAME="Heetch"

export COLOR_01="#190134"           # Black (Host)
export COLOR_02="#27D9D5"           # Red (Syntax string)
export COLOR_03="#C33678"           # Green (Command)
export COLOR_04="#8F6C97"           # Yellow (Command second)
export COLOR_05="#BD0152"           # Blue (Path)
export COLOR_06="#82034C"           # Magenta (Syntax var)
export COLOR_07="#F80059"           # Cyan (Prompt)
export COLOR_08="#BDB6C5"           # White

export COLOR_09="#7B6D8B"           # Bright Black
export COLOR_10="#27D9D5"           # Bright Red (Command error)
export COLOR_11="#C33678"           # Bright Green (Exec)
export COLOR_12="#8F6C97"           # Bright Yellow
export COLOR_13="#BD0152"           # Bright Blue (Folder)
export COLOR_14="#82034C"           # Bright Magenta
export COLOR_15="#F80059"           # Bright Cyan
export COLOR_16="#FEFFFF"           # Bright White

export BACKGROUND_COLOR="#190134"   # Background
export FOREGROUND_COLOR="#BDB6C5"   # Foreground (Text)

export CURSOR_COLOR="#BDB6C5" # Cursor

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
