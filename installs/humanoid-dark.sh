#!/usr/bin/env bash

export PROFILE_NAME="Humanoid Dark"

export COLOR_01="#232629"           # Black (Host)
export COLOR_02="#F11235"           # Red (Syntax string)
export COLOR_03="#02D849"           # Green (Command)
export COLOR_04="#FFB627"           # Yellow (Command second)
export COLOR_05="#00A6FB"           # Blue (Path)
export COLOR_06="#F15EE3"           # Magenta (Syntax var)
export COLOR_07="#0DD9D6"           # Cyan (Prompt)
export COLOR_08="#F8F8F2"           # White

export COLOR_09="#60615D"           # Bright Black
export COLOR_10="#F11235"           # Bright Red (Command error)
export COLOR_11="#02D849"           # Bright Green (Exec)
export COLOR_12="#FFB627"           # Bright Yellow
export COLOR_13="#00A6FB"           # Bright Blue (Folder)
export COLOR_14="#F15EE3"           # Bright Magenta
export COLOR_15="#0DD9D6"           # Bright Cyan
export COLOR_16="#FCFCFC"           # Bright White

export BACKGROUND_COLOR="#232629"   # Background
export FOREGROUND_COLOR="#F8F8F2"   # Foreground (Text)

export CURSOR_COLOR="#F8F8F2" # Cursor

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
