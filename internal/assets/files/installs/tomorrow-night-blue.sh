#!/usr/bin/env bash

export PROFILE_NAME="Tomorrow Night Blue"

export COLOR_01="#00346E"           # Black (Host)
export COLOR_02="#FF9DA4"           # Red (Syntax string)
export COLOR_03="#D1F1A9"           # Green (Command)
export COLOR_04="#FFEEAD"           # Yellow (Command second)
export COLOR_05="#BBDAFF"           # Blue (Path)
export COLOR_06="#EBBBFF"           # Magenta (Syntax var)
export COLOR_07="#99FFFF"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#7285B7"           # Bright Black
export COLOR_10="#FF9DA4"           # Bright Red (Command error)
export COLOR_11="#D1F1A9"           # Bright Green (Exec)
export COLOR_12="#FFEEAD"           # Bright Yellow
export COLOR_13="#BBDAFF"           # Bright Blue (Folder)
export COLOR_14="#EBBBFF"           # Bright Magenta
export COLOR_15="#99FFFF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#002451"   # Background
export FOREGROUND_COLOR="#FFFFFF"   # Foreground (Text)

export CURSOR_COLOR="#FFFFFF" # Cursor

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
