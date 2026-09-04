#!/usr/bin/env bash

export PROFILE_NAME="Shrek"

export COLOR_01="#472D1A"           # Black (Host)
export COLOR_02="#FF1212"           # Red (Syntax string)
export COLOR_03="#7FFF00"           # Green (Command)
export COLOR_04="#FFD700"           # Yellow (Command second)
export COLOR_05="#3399FF"           # Blue (Path)
export COLOR_06="#9933FF"           # Magenta (Syntax var)
export COLOR_07="#00CCCC"           # Cyan (Prompt)
export COLOR_08="#FFFFE0"           # White

export COLOR_09="#3A5F3A"           # Bright Black
export COLOR_10="#FF3333"           # Bright Red (Command error)
export COLOR_11="#ADFF2F"           # Bright Green (Exec)
export COLOR_12="#FFEA00"           # Bright Yellow
export COLOR_13="#66B2FF"           # Bright Blue (Folder)
export COLOR_14="#B266FF"           # Bright Magenta
export COLOR_15="#33FFFF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#475347"   # Background
export FOREGROUND_COLOR="#F0F0C0"   # Foreground (Text)

export CURSOR_COLOR="#F0F0C0" # Cursor

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
