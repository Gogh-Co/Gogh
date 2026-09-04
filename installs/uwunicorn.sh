#!/usr/bin/env bash

export PROFILE_NAME="Uwunicorn"

export COLOR_01="#241B26"           # Black (Host)
export COLOR_02="#877BB6"           # Red (Syntax string)
export COLOR_03="#C965BF"           # Green (Command)
export COLOR_04="#A84A73"           # Yellow (Command second)
export COLOR_05="#6A9EB5"           # Blue (Path)
export COLOR_06="#78A38F"           # Magenta (Syntax var)
export COLOR_07="#9C5FCE"           # Cyan (Prompt)
export COLOR_08="#EED5D9"           # White

export COLOR_09="#6C3CB2"           # Bright Black
export COLOR_10="#877BB6"           # Bright Red (Command error)
export COLOR_11="#C965BF"           # Bright Green (Exec)
export COLOR_12="#A84A73"           # Bright Yellow
export COLOR_13="#6A9EB5"           # Bright Blue (Folder)
export COLOR_14="#78A38F"           # Bright Magenta
export COLOR_15="#9C5FCE"           # Bright Cyan
export COLOR_16="#E4CCD0"           # Bright White

export BACKGROUND_COLOR="#241B26"   # Background
export FOREGROUND_COLOR="#EED5D9"   # Foreground (Text)

export CURSOR_COLOR="#EED5D9" # Cursor

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
