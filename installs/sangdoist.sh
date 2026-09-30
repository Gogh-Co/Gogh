#!/usr/bin/env bash

export PROFILE_NAME="Sangdoist"

export COLOR_01="#131417"           # Black (Host)
export COLOR_02="#EC6029"           # Red (Syntax string)
export COLOR_03="#A1C246"           # Green (Command)
export COLOR_04="#E5BD2B"           # Yellow (Command second)
export COLOR_05="#2D7AEC"           # Blue (Path)
export COLOR_06="#B95485"           # Magenta (Syntax var)
export COLOR_07="#A3CBC2"           # Cyan (Prompt)
export COLOR_08="#E0E0DC"           # White

export COLOR_09="#62627A"           # Bright Black
export COLOR_10="#E43E1D"           # Bright Red (Command error)
export COLOR_11="#75BF52"           # Bright Green (Exec)
export COLOR_12="#E4C92E"           # Bright Yellow
export COLOR_13="#3641CF"           # Bright Blue (Folder)
export COLOR_14="#D3579D"           # Bright Magenta
export COLOR_15="#BFC9E1"           # Bright Cyan
export COLOR_16="#E7E7E4"           # Bright White

export BACKGROUND_COLOR="#131417"   # Background
export FOREGROUND_COLOR="#CECECC"   # Foreground (Text)

export CURSOR_COLOR="#CECECC" # Cursor

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
