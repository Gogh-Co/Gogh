#!/usr/bin/env bash

export PROFILE_NAME="Base2Tone Desert"

export COLOR_01="#292724"           # Black (Host)
export COLOR_02="#816F4B"           # Red (Syntax string)
export COLOR_03="#EC9255"           # Green (Command)
export COLOR_04="#FFB380"           # Yellow (Command second)
export COLOR_05="#957E50"           # Blue (Path)
export COLOR_06="#EC9255"           # Magenta (Syntax var)
export COLOR_07="#AC8E53"           # Cyan (Prompt)
export COLOR_08="#ADA594"           # White

export COLOR_09="#7E7767"           # Bright Black
export COLOR_10="#F29D63"           # Bright Red (Command error)
export COLOR_11="#3D3A34"           # Bright Green (Exec)
export COLOR_12="#615C51"           # Bright Yellow
export COLOR_13="#908774"           # Bright Blue (Folder)
export COLOR_14="#DDCBA6"           # Bright Magenta
export COLOR_15="#E58748"           # Bright Cyan
export COLOR_16="#F2EAD9"           # Bright White

export BACKGROUND_COLOR="#292724"   # Background
export FOREGROUND_COLOR="#ADA594"   # Foreground (Text)

export CURSOR_COLOR="#BC672F" # Cursor

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
