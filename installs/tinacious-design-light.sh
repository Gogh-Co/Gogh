#!/usr/bin/env bash

export PROFILE_NAME="Tinacious Design Light"

export COLOR_01="#1D1D26"           # Black (Host)
export COLOR_02="#FF3399"           # Red (Syntax string)
export COLOR_03="#00D364"           # Green (Command)
export COLOR_04="#FFCC66"           # Yellow (Command second)
export COLOR_05="#00CBFF"           # Blue (Path)
export COLOR_06="#CC66FF"           # Magenta (Syntax var)
export COLOR_07="#00CECA"           # Cyan (Prompt)
export COLOR_08="#CBCBF0"           # White

export COLOR_09="#636667"           # Bright Black
export COLOR_10="#FF2F92"           # Bright Red (Command error)
export COLOR_11="#00D364"           # Bright Green (Exec)
export COLOR_12="#FFD479"           # Bright Yellow
export COLOR_13="#00CBFF"           # Bright Blue (Folder)
export COLOR_14="#D783FF"           # Bright Magenta
export COLOR_15="#00D5D4"           # Bright Cyan
export COLOR_16="#D5D6F3"           # Bright White

export BACKGROUND_COLOR="#F8F8FF"   # Background
export FOREGROUND_COLOR="#1D1D26"   # Foreground (Text)

export CURSOR_COLOR="#CBCBF0" # Cursor

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
