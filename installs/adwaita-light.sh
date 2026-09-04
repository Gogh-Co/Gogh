#!/usr/bin/env bash

export PROFILE_NAME="Adwaita Light"

export COLOR_01="#FCFCFC"           # Black (Host)
export COLOR_02="#ED333B"           # Red (Syntax string)
export COLOR_03="#57E389"           # Green (Command)
export COLOR_04="#FF7800"           # Yellow (Command second)
export COLOR_05="#62A0EA"           # Blue (Path)
export COLOR_06="#9141AC"           # Magenta (Syntax var)
export COLOR_07="#5BC8AF"           # Cyan (Prompt)
export COLOR_08="#DEDDDA"           # White

export COLOR_09="#9A9996"           # Bright Black
export COLOR_10="#F66151"           # Bright Red (Command error)
export COLOR_11="#8FF0A4"           # Bright Green (Exec)
export COLOR_12="#FFA348"           # Bright Yellow
export COLOR_13="#99C1F1"           # Bright Blue (Folder)
export COLOR_14="#DC8ADD"           # Bright Magenta
export COLOR_15="#93DDC2"           # Bright Cyan
export COLOR_16="#F6F5F4"           # Bright White

export BACKGROUND_COLOR="#FCFCFC"   # Background
export FOREGROUND_COLOR="#504E55"   # Foreground (Text)

export CURSOR_COLOR="#504E55" # Cursor

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
