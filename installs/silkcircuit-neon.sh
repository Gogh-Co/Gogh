#!/usr/bin/env bash

export PROFILE_NAME="SilkCircuit Neon"

export COLOR_01="#12101A"           # Black (Host)
export COLOR_02="#FF6363"           # Red (Syntax string)
export COLOR_03="#50FA7B"           # Green (Command)
export COLOR_04="#F1FA8C"           # Yellow (Command second)
export COLOR_05="#82AAFF"           # Blue (Path)
export COLOR_06="#FF00FF"           # Magenta (Syntax var)
export COLOR_07="#80FFEA"           # Cyan (Prompt)
export COLOR_08="#F8F8F2"           # White

export COLOR_09="#768D8D"           # Bright Black
export COLOR_10="#FF8787"           # Bright Red (Command error)
export COLOR_11="#86FBA8"           # Bright Green (Exec)
export COLOR_12="#FFFFA5"           # Bright Yellow
export COLOR_13="#82B1FF"           # Bright Blue (Folder)
export COLOR_14="#FF69FF"           # Bright Magenta
export COLOR_15="#5FFFFF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#12101A"   # Background
export FOREGROUND_COLOR="#F8F8F2"   # Foreground (Text)

export CURSOR_COLOR="#80FFEA" # Cursor

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
