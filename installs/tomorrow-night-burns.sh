#!/usr/bin/env bash

export PROFILE_NAME="Tomorrow Night Burns"

export COLOR_01="#252525"           # Black (Host)
export COLOR_02="#832E31"           # Red (Syntax string)
export COLOR_03="#A63C40"           # Green (Command)
export COLOR_04="#D3494E"           # Yellow (Command second)
export COLOR_05="#FC595F"           # Blue (Path)
export COLOR_06="#DF9395"           # Magenta (Syntax var)
export COLOR_07="#BA8586"           # Cyan (Prompt)
export COLOR_08="#F5F5F5"           # White

export COLOR_09="#5D6F71"           # Bright Black
export COLOR_10="#832E31"           # Bright Red (Command error)
export COLOR_11="#A63C40"           # Bright Green (Exec)
export COLOR_12="#D2494E"           # Bright Yellow
export COLOR_13="#FC595F"           # Bright Blue (Folder)
export COLOR_14="#DF9395"           # Bright Magenta
export COLOR_15="#BA8586"           # Bright Cyan
export COLOR_16="#F5F5F5"           # Bright White

export BACKGROUND_COLOR="#151515"   # Background
export FOREGROUND_COLOR="#A1B0B8"   # Foreground (Text)

export CURSOR_COLOR="#FF443E" # Cursor

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
