#!/usr/bin/env bash

export PROFILE_NAME="Zenwritten Dark"

export COLOR_01="#191919"           # Black (Host)
export COLOR_02="#DE6E7C"           # Red (Syntax string)
export COLOR_03="#819B69"           # Green (Command)
export COLOR_04="#B77E64"           # Yellow (Command second)
export COLOR_05="#6099C0"           # Blue (Path)
export COLOR_06="#B279A7"           # Magenta (Syntax var)
export COLOR_07="#66A5AD"           # Cyan (Prompt)
export COLOR_08="#BBBBBB"           # White

export COLOR_09="#3D3839"           # Bright Black
export COLOR_10="#E8838F"           # Bright Red (Command error)
export COLOR_11="#8BAE68"           # Bright Green (Exec)
export COLOR_12="#D68C67"           # Bright Yellow
export COLOR_13="#61ABDA"           # Bright Blue (Folder)
export COLOR_14="#CF86C1"           # Bright Magenta
export COLOR_15="#65B8C1"           # Bright Cyan
export COLOR_16="#8E8E8E"           # Bright White

export BACKGROUND_COLOR="#191919"   # Background
export FOREGROUND_COLOR="#BBBBBB"   # Foreground (Text)

export CURSOR_COLOR="#C9C9C9" # Cursor

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
