#!/usr/bin/env bash

export PROFILE_NAME="Builtin Solarized Light"

export COLOR_01="#FDF6E3"           # Black (Host)
export COLOR_02="#DC322F"           # Red (Syntax string)
export COLOR_03="#859900"           # Green (Command)
export COLOR_04="#839496"           # Yellow (Command second)
export COLOR_05="#268BD2"           # Blue (Path)
export COLOR_06="#D33682"           # Magenta (Syntax var)
export COLOR_07="#2AA198"           # Cyan (Prompt)
export COLOR_08="#B2B8AD"           # White

export COLOR_09="#3B5A5D"           # Bright Black
export COLOR_10="#CB4B16"           # Bright Red (Command error)
export COLOR_11="#586E75"           # Bright Green (Exec)
export COLOR_12="#657B83"           # Bright Yellow
export COLOR_13="#839496"           # Bright Blue (Folder)
export COLOR_14="#6C71C4"           # Bright Magenta
export COLOR_15="#93A1A1"           # Bright Cyan
export COLOR_16="#002B36"           # Bright White

export BACKGROUND_COLOR="#FDF6E3"   # Background
export FOREGROUND_COLOR="#B2B8AD"   # Foreground (Text)

export CURSOR_COLOR="#B2B8AD" # Cursor

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
