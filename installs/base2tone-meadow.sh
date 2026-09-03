#!/usr/bin/env bash

export PROFILE_NAME="Base2Tone Meadow"

export COLOR_01="#192834"           # Black (Host)
export COLOR_02="#277FBE"           # Red (Syntax string)
export COLOR_03="#80BF40"           # Green (Command)
export COLOR_04="#A6F655"           # Yellow (Command second)
export COLOR_05="#4299D7"           # Blue (Path)
export COLOR_06="#80BF40"           # Magenta (Syntax var)
export COLOR_07="#47ADF5"           # Cyan (Prompt)
export COLOR_08="#7B9EB7"           # White

export COLOR_09="#3D5E76"           # Bright Black
export COLOR_10="#8CDD3C"           # Bright Red (Command error)
export COLOR_11="#223644"           # Bright Green (Exec)
export COLOR_12="#335166"           # Bright Yellow
export COLOR_13="#466B86"           # Bright Blue (Folder)
export COLOR_14="#AFDDFE"           # Bright Magenta
export COLOR_15="#73B234"           # Bright Cyan
export COLOR_16="#D1ECFF"           # Bright White

export BACKGROUND_COLOR="#192834"   # Background
export FOREGROUND_COLOR="#7B9EB7"   # Foreground (Text)

export CURSOR_COLOR="#4D8217" # Cursor

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
