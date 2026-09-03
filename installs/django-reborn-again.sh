#!/usr/bin/env bash

export PROFILE_NAME="Django Reborn Again"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#FD6209"           # Red (Syntax string)
export COLOR_03="#41A83E"           # Green (Command)
export COLOR_04="#FFE862"           # Yellow (Command second)
export COLOR_05="#245032"           # Blue (Path)
export COLOR_06="#F8F8F8"           # Magenta (Syntax var)
export COLOR_07="#9DF39F"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#323232"           # Bright Black
export COLOR_10="#FF943B"           # Bright Red (Command error)
export COLOR_11="#73DA70"           # Bright Green (Exec)
export COLOR_12="#FFFF94"           # Bright Yellow
export COLOR_13="#568264"           # Bright Blue (Folder)
export COLOR_14="#FFFFFF"           # Bright Magenta
export COLOR_15="#CFFFD1"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#051F14"   # Background
export FOREGROUND_COLOR="#DADEDC"   # Foreground (Text)

export CURSOR_COLOR="#FFCC00" # Cursor

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
