#!/usr/bin/env bash

export PROFILE_NAME="Wombat"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#FF615A"           # Red (Syntax string)
export COLOR_03="#B1E969"           # Green (Command)
export COLOR_04="#EBD99C"           # Yellow (Command second)
export COLOR_05="#5DA9F6"           # Blue (Path)
export COLOR_06="#E86AFF"           # Magenta (Syntax var)
export COLOR_07="#82FFF7"           # Cyan (Prompt)
export COLOR_08="#DEDACF"           # White

export COLOR_09="#313131"           # Bright Black
export COLOR_10="#F58C80"           # Bright Red (Command error)
export COLOR_11="#DDF88F"           # Bright Green (Exec)
export COLOR_12="#EEE5B2"           # Bright Yellow
export COLOR_13="#A5C7FF"           # Bright Blue (Folder)
export COLOR_14="#DDAAFF"           # Bright Magenta
export COLOR_15="#B7FFF9"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#171717"   # Background
export FOREGROUND_COLOR="#DEDACF"   # Foreground (Text)

export CURSOR_COLOR="#DEDACF" # Cursor

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
