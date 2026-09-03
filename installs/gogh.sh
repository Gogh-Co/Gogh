#!/usr/bin/env bash

export PROFILE_NAME="Gogh"

export COLOR_01="#243342"           # Black (Host)
export COLOR_02="#C54133"           # Red (Syntax string)
export COLOR_03="#27AE60"           # Green (Command)
export COLOR_04="#EDB20A"           # Yellow (Command second)
export COLOR_05="#2479D0"           # Blue (Path)
export COLOR_06="#7D3EA0"           # Magenta (Syntax var)
export COLOR_07="#1D8579"           # Cyan (Prompt)
export COLOR_08="#C9CCCD"           # White

export COLOR_09="#34495E"           # Bright Black
export COLOR_10="#E74C3C"           # Bright Red (Command error)
export COLOR_11="#2ECC71"           # Bright Green (Exec)
export COLOR_12="#F1C40F"           # Bright Yellow
export COLOR_13="#3498DB"           # Bright Blue (Folder)
export COLOR_14="#9B59B6"           # Bright Magenta
export COLOR_15="#2AA198"           # Bright Cyan
export COLOR_16="#ECF0F1"           # Bright White

export BACKGROUND_COLOR="#292D3E"   # Background
export FOREGROUND_COLOR="#ECF0F1"   # Foreground (Text)

export CURSOR_COLOR="#ECF0F1" # Cursor

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
