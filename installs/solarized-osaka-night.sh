#!/usr/bin/env bash

export PROFILE_NAME="Solarized Osaka Night"

export COLOR_01="#15161D"           # Black (Host)
export COLOR_02="#E77D8F"           # Red (Syntax string)
export COLOR_03="#A8CD76"           # Green (Command)
export COLOR_04="#D8B172"           # Yellow (Command second)
export COLOR_05="#82A1F1"           # Blue (Path)
export COLOR_06="#B69BF1"           # Magenta (Syntax var)
export COLOR_07="#90CDFA"           # Cyan (Prompt)
export COLOR_08="#AAB1D3"           # White

export COLOR_09="#424866"           # Bright Black
export COLOR_10="#E77D8F"           # Bright Red (Command error)
export COLOR_11="#A8CD76"           # Bright Green (Exec)
export COLOR_12="#D8B172"           # Bright Yellow
export COLOR_13="#82A1F1"           # Bright Blue (Folder)
export COLOR_14="#B69BF1"           # Bright Magenta
export COLOR_15="#90CDFA"           # Bright Cyan
export COLOR_16="#C2CAF1"           # Bright White

export BACKGROUND_COLOR="#1A1B25"   # Background
export FOREGROUND_COLOR="#C2CAF1"   # Foreground (Text)

export CURSOR_COLOR="#C2CAF1" # Cursor

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
