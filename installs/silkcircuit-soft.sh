#!/usr/bin/env bash

export PROFILE_NAME="SilkCircuit Soft"

export COLOR_01="#141220"           # Black (Host)
export COLOR_02="#FF6677"           # Red (Syntax string)
export COLOR_03="#66FF99"           # Green (Command)
export COLOR_04="#FFE699"           # Yellow (Command second)
export COLOR_05="#92AAFF"           # Blue (Path)
export COLOR_06="#FF99FF"           # Magenta (Syntax var)
export COLOR_07="#99FFEE"           # Cyan (Prompt)
export COLOR_08="#F8F8F2"           # White

export COLOR_09="#6272A4"           # Bright Black
export COLOR_10="#FF7788"           # Bright Red (Command error)
export COLOR_11="#80FFB3"           # Bright Green (Exec)
export COLOR_12="#FFFFA5"           # Bright Yellow
export COLOR_13="#A2BBFF"           # Bright Blue (Folder)
export COLOR_14="#FFB3FF"           # Bright Magenta
export COLOR_15="#B3FFEA"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#1A1626"   # Background
export FOREGROUND_COLOR="#F8F8F2"   # Foreground (Text)

export CURSOR_COLOR="#99FFEE" # Cursor

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
