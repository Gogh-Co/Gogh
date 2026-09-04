#!/usr/bin/env bash

export PROFILE_NAME="Material Lighter"

export COLOR_01="#FAFAFA"           # Black (Host)
export COLOR_02="#FF5370"           # Red (Syntax string)
export COLOR_03="#91B859"           # Green (Command)
export COLOR_04="#FFB62C"           # Yellow (Command second)
export COLOR_05="#6182B8"           # Blue (Path)
export COLOR_06="#7C4DFF"           # Magenta (Syntax var)
export COLOR_07="#39ADB5"           # Cyan (Prompt)
export COLOR_08="#80CBC4"           # White

export COLOR_09="#CCD7DA"           # Bright Black
export COLOR_10="#FF5370"           # Bright Red (Command error)
export COLOR_11="#91B859"           # Bright Green (Exec)
export COLOR_12="#FFB62C"           # Bright Yellow
export COLOR_13="#6182B8"           # Bright Blue (Folder)
export COLOR_14="#7C4DFF"           # Bright Magenta
export COLOR_15="#39ADB5"           # Bright Cyan
export COLOR_16="#000000"           # Bright White

export BACKGROUND_COLOR="#FAFAFA"   # Background
export FOREGROUND_COLOR="#80CBC4"   # Foreground (Text)

export CURSOR_COLOR="#80CBC4" # Cursor

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
