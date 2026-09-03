#!/usr/bin/env bash

export PROFILE_NAME="Base4Tone Modern N"

export COLOR_01="#1A2023"           # Black (Host)
export COLOR_02="#D53975"           # Red (Syntax string)
export COLOR_03="#A48F04"           # Green (Command)
export COLOR_04="#DCC218"           # Yellow (Command second)
export COLOR_05="#47B5F5"           # Blue (Path)
export COLOR_06="#8493F6"           # Magenta (Syntax var)
export COLOR_07="#C1AA15"           # Cyan (Prompt)
export COLOR_08="#E8EBEE"           # White

export COLOR_09="#070B0D"           # Bright Black
export COLOR_10="#EB75A2"           # Bright Red (Command error)
export COLOR_11="#E6CA1A"           # Bright Green (Exec)
export COLOR_12="#F2E58C"           # Bright Yellow
export COLOR_13="#BBE4FB"           # Bright Blue (Folder)
export COLOR_14="#A0ACF8"           # Bright Magenta
export COLOR_15="#B1E0FB"           # Bright Cyan
export COLOR_16="#F6F8F9"           # Bright White

export BACKGROUND_COLOR="#1A2023"   # Background
export FOREGROUND_COLOR="#8A9DA8"   # Foreground (Text)

export CURSOR_COLOR="#85826F" # Cursor

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
