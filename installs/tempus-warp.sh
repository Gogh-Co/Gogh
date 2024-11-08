#!/usr/bin/env bash

export PROFILE_NAME="Tempus Warp"

export COLOR_01="#001514"           # Black (Host)
export COLOR_02="#ff3737"           # Red (Syntax string)
export COLOR_03="#169c16"           # Green (Command)
export COLOR_04="#9f8500"           # Yellow (Command second)
export COLOR_05="#5781ef"           # Blue (Path)
export COLOR_06="#da4ebf"           # Magenta (Syntax var)
export COLOR_07="#009880"           # Cyan (Prompt)
export COLOR_08="#968282"           # White

export COLOR_09="#261c2c"           # Bright Black
export COLOR_10="#f0681a"           # Bright Red (Command error)
export COLOR_11="#3aa73a"           # Bright Green (Exec)
export COLOR_12="#ba8a00"           # Bright Yellow
export COLOR_13="#8887f0"           # Bright Blue (Folder)
export COLOR_14="#d85cf2"           # Bright Magenta
export COLOR_15="#1da1af"           # Bright Cyan
export COLOR_16="#a29fa0"           # Bright White

export BACKGROUND_COLOR="#001514"   # Background
export FOREGROUND_COLOR="#a29fa0"   # Foreground (Text)

export CURSOR_COLOR="#a29fa0" # Cursor

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
