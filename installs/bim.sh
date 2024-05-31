#!/usr/bin/env bash

export PROFILE_NAME="Bim"

export COLOR_01="#2C2423"           # Black (Host)
export COLOR_02="#F557A0"           # Red (Syntax string)
export COLOR_03="#A9EE55"           # Green (Command)
export COLOR_04="#F5A255"           # Yellow (Command second)
export COLOR_05="#5EA2EC"           # Blue (Path)
export COLOR_06="#A957EC"           # Magenta (Syntax var)
export COLOR_07="#5EEEA0"           # Cyan (Prompt)
export COLOR_08="#918988"           # White

export COLOR_09="#918988"           # Bright Black
export COLOR_10="#F579B2"           # Bright Red (Command error)
export COLOR_11="#BBEE78"           # Bright Green (Exec)
export COLOR_12="#F5B378"           # Bright Yellow
export COLOR_13="#81B3EC"           # Bright Blue (Folder)
export COLOR_14="#BB79EC"           # Bright Magenta
export COLOR_15="#81EEB2"           # Bright Cyan
export COLOR_16="#F5EEEC"           # Bright White

export BACKGROUND_COLOR="#012849"   # Background
export FOREGROUND_COLOR="#A9BED8"   # Foreground (Text)

export CURSOR_COLOR="#A9BED8" # Cursor

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
