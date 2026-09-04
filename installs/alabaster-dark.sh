#!/usr/bin/env bash

export PROFILE_NAME="Alabaster Dark"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#E25D56"           # Red (Syntax string)
export COLOR_03="#73CA50"           # Green (Command)
export COLOR_04="#E9BF57"           # Yellow (Command second)
export COLOR_05="#4A88E4"           # Blue (Path)
export COLOR_06="#915CAF"           # Magenta (Syntax var)
export COLOR_07="#23ACDD"           # Cyan (Prompt)
export COLOR_08="#CECECE"           # White

export COLOR_09="#777777"           # Bright Black
export COLOR_10="#F36868"           # Bright Red (Command error)
export COLOR_11="#88DB3F"           # Bright Green (Exec)
export COLOR_12="#F0BF7A"           # Bright Yellow
export COLOR_13="#6F8FDB"           # Bright Blue (Folder)
export COLOR_14="#E987E9"           # Bright Magenta
export COLOR_15="#4AC9E2"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#0E1415"   # Background
export FOREGROUND_COLOR="#CECECE"   # Foreground (Text)

export CURSOR_COLOR="#CECECE" # Cursor

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
