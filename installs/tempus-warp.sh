#!/usr/bin/env bash

export PROFILE_NAME="Tempus Warp"

export COLOR_01="#001514"           # Black (Host)
export COLOR_02="#FF3737"           # Red (Syntax string)
export COLOR_03="#169C16"           # Green (Command)
export COLOR_04="#9F8500"           # Yellow (Command second)
export COLOR_05="#5781EF"           # Blue (Path)
export COLOR_06="#DA4EBF"           # Magenta (Syntax var)
export COLOR_07="#009880"           # Cyan (Prompt)
export COLOR_08="#968282"           # White

export COLOR_09="#261C2C"           # Bright Black
export COLOR_10="#F0681A"           # Bright Red (Command error)
export COLOR_11="#3AA73A"           # Bright Green (Exec)
export COLOR_12="#BA8A00"           # Bright Yellow
export COLOR_13="#8887F0"           # Bright Blue (Folder)
export COLOR_14="#D85CF2"           # Bright Magenta
export COLOR_15="#1DA1AF"           # Bright Cyan
export COLOR_16="#A29FA0"           # Bright White

export BACKGROUND_COLOR="#001514"   # Background
export FOREGROUND_COLOR="#A29FA0"   # Foreground (Text)

export CURSOR_COLOR="#A29FA0" # Cursor

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
