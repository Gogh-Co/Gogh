#!/usr/bin/env bash

export PROFILE_NAME="Ayaka"

export COLOR_01="#36283d"           # Black (Host)
export COLOR_02="#71ADE9"           # Red (Syntax string)
export COLOR_03="#AB8CAE"           # Green (Command)
export COLOR_04="#9EA0D3"           # Yellow (Command second)
export COLOR_05="#8BB8E9"           # Blue (Path)
export COLOR_06="#E1B4CE"           # Magenta (Syntax var)
export COLOR_07="#cedaeb"           # Cyan (Prompt)
export COLOR_08="#9098a4"           # White

export COLOR_09="#71ADE9"           # Bright Black
export COLOR_10="#AB8CAE"           # Bright Red (Command error)
export COLOR_11="#E59DB1"           # Bright Green (Exec)
export COLOR_12="#9EA0D3"           # Bright Yellow
export COLOR_13="#8BB8E9"           # Bright Blue (Folder)
export COLOR_14="#E1B4CE"           # Bright Magenta
export COLOR_15="#cedaeb"           # Bright Cyan
export COLOR_16="#FFFEFE"           # Bright White

export BACKGROUND_COLOR="#36283d"   # Background
export FOREGROUND_COLOR="#cedaeb"   # Foreground (Text)

export CURSOR_COLOR="#cedaeb" # Cursor

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
