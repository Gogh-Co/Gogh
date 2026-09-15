#!/usr/bin/env bash

export PROFILE_NAME="SilkCircuit Vibrant"

export COLOR_01="#0F0C1A"           # Black (Host)
export COLOR_02="#FF3366"           # Red (Syntax string)
export COLOR_03="#00FF66"           # Green (Command)
export COLOR_04="#FFCC00"           # Yellow (Command second)
export COLOR_05="#6699FF"           # Blue (Path)
export COLOR_06="#FF00CC"           # Magenta (Syntax var)
export COLOR_07="#00FFCC"           # Cyan (Prompt)
export COLOR_08="#F8F8F2"           # White

export COLOR_09="#728989"           # Bright Black
export COLOR_10="#FF6677"           # Bright Red (Command error)
export COLOR_11="#66FF99"           # Bright Green (Exec)
export COLOR_12="#FFFF66"           # Bright Yellow
export COLOR_13="#88AAFF"           # Bright Blue (Folder)
export COLOR_14="#FF66FF"           # Bright Magenta
export COLOR_15="#00FFFF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#0F0C1A"   # Background
export FOREGROUND_COLOR="#F8F8F2"   # Foreground (Text)

export CURSOR_COLOR="#00FFCC" # Cursor

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
