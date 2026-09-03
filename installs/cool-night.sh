#!/usr/bin/env bash

export PROFILE_NAME="Cool Night"

export COLOR_01="#0B3B61"           # Black (Host)
export COLOR_02="#FF3A3A"           # Red (Syntax string)
export COLOR_03="#52FFD0"           # Green (Command)
export COLOR_04="#FFF383"           # Yellow (Command second)
export COLOR_05="#1376F9"           # Blue (Path)
export COLOR_06="#C792EA"           # Magenta (Syntax var)
export COLOR_07="#FF5ED4"           # Cyan (Prompt)
export COLOR_08="#16FDA2"           # White

export COLOR_09="#63686D"           # Bright Black
export COLOR_10="#FF54B0"           # Bright Red (Command error)
export COLOR_11="#74FFD8"           # Bright Green (Exec)
export COLOR_12="#FCF5AE"           # Bright Yellow
export COLOR_13="#388EFF"           # Bright Blue (Folder)
export COLOR_14="#AE81FF"           # Bright Magenta
export COLOR_15="#FF6AD7"           # Bright Cyan
export COLOR_16="#60FBBF"           # Bright White

export BACKGROUND_COLOR="#010C18"   # Background
export FOREGROUND_COLOR="#ECDEF4"   # Foreground (Text)

export CURSOR_COLOR="#38FF9D" # Cursor

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
