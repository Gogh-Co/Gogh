#!/usr/bin/env bash

export PROFILE_NAME="Predawn"

export COLOR_01="#F18260"           # Black (Host)
export COLOR_02="#B51A20"           # Red (Syntax string)
export COLOR_03="#A6CC75"           # Green (Command)
export COLOR_04="#FED33A"           # Yellow (Command second)
export COLOR_05="#81B2B1"           # Blue (Path)
export COLOR_06="#EB6C4E"           # Magenta (Syntax var)
export COLOR_07="#81B2B1"           # Cyan (Prompt)
export COLOR_08="#EAEAEA"           # White

export COLOR_09="#666666"           # Bright Black
export COLOR_10="#FF000B"           # Bright Red (Command error)
export COLOR_11="#C4EE94"           # Bright Green (Exec)
export COLOR_12="#E8E06D"           # Bright Yellow
export COLOR_13="#A5EBEA"           # Bright Blue (Folder)
export COLOR_14="#EF8A50"           # Bright Magenta
export COLOR_15="#A5EBEA"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#282828"   # Background
export FOREGROUND_COLOR="#F1F1F1"   # Foreground (Text)

export CURSOR_COLOR="#F1F1F1" # Cursor

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
