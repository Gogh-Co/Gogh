#!/usr/bin/env bash

export PROFILE_NAME="Base4Tone Classic A"

export COLOR_01="#211D1C"           # Black (Host)
export COLOR_02="#8D9F04"           # Red (Syntax string)
export COLOR_03="#DD40A4"           # Green (Command)
export COLOR_04="#F17EC7"           # Yellow (Command second)
export COLOR_05="#EB8275"           # Blue (Path)
export COLOR_06="#DC9118"           # Magenta (Syntax var)
export COLOR_07="#E963B8"           # Cyan (Prompt)
export COLOR_08="#EEE8E8"           # White

export COLOR_09="#0D0807"           # Bright Black
export COLOR_10="#B9CF17"           # Bright Red (Command error)
export COLOR_11="#F391CF"           # Bright Green (Exec)
export COLOR_12="#F6B1DD"           # Bright Yellow
export COLOR_13="#F8CAC3"           # Bright Blue (Folder)
export COLOR_14="#E8A02C"           # Bright Magenta
export COLOR_15="#FBBAB1"           # Bright Cyan
export COLOR_16="#F9F6F6"           # Bright White

export BACKGROUND_COLOR="#211D1C"   # Background
export FOREGROUND_COLOR="#A19391"   # Foreground (Text)

export CURSOR_COLOR="#81747C" # Cursor

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
