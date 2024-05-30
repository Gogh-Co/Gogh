#!/usr/bin/env bash

export PROFILE_NAME="Red Sands"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#FF3F00"           # Red (Syntax string)
export COLOR_03="#00BB00"           # Green (Command)
export COLOR_04="#E7B000"           # Yellow (Command second)
export COLOR_05="#0072FF"           # Blue (Path)
export COLOR_06="#BB00BB"           # Magenta (Syntax var)
export COLOR_07="#00BBBB"           # Cyan (Prompt)
export COLOR_08="#BBBBBB"           # White

export COLOR_09="#555555"           # Bright Black
export COLOR_10="#BB0000"           # Bright Red (Command error)
export COLOR_11="#00BB00"           # Bright Green (Exec)
export COLOR_12="#E7B000"           # Bright Yellow
export COLOR_13="#0072AE"           # Bright Blue (Folder)
export COLOR_14="#FF55FF"           # Bright Magenta
export COLOR_15="#55FFFF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#7A251E"   # Background
export FOREGROUND_COLOR="#D7C9A7"   # Foreground (Text)

export CURSOR_COLOR="#D7C9A7" # Cursor

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
