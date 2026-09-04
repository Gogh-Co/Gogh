#!/usr/bin/env bash

export PROFILE_NAME="Pico"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#FF004D"           # Red (Syntax string)
export COLOR_03="#00E756"           # Green (Command)
export COLOR_04="#FFF024"           # Yellow (Command second)
export COLOR_05="#83769C"           # Blue (Path)
export COLOR_06="#FF77A8"           # Magenta (Syntax var)
export COLOR_07="#29ADFF"           # Cyan (Prompt)
export COLOR_08="#5F574F"           # White

export COLOR_09="#008751"           # Bright Black
export COLOR_10="#FF004D"           # Bright Red (Command error)
export COLOR_11="#00E756"           # Bright Green (Exec)
export COLOR_12="#FFF024"           # Bright Yellow
export COLOR_13="#83769C"           # Bright Blue (Folder)
export COLOR_14="#FF77A8"           # Bright Magenta
export COLOR_15="#29ADFF"           # Bright Cyan
export COLOR_16="#FFF1E8"           # Bright White

export BACKGROUND_COLOR="#000000"   # Background
export FOREGROUND_COLOR="#5F574F"   # Foreground (Text)

export CURSOR_COLOR="#5F574F" # Cursor

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
