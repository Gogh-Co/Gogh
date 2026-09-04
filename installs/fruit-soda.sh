#!/usr/bin/env bash

export PROFILE_NAME="Fruit Soda"

export COLOR_01="#F1ECF1"           # Black (Host)
export COLOR_02="#FE3E31"           # Red (Syntax string)
export COLOR_03="#47F74C"           # Green (Command)
export COLOR_04="#F7E203"           # Yellow (Command second)
export COLOR_05="#2931DF"           # Blue (Path)
export COLOR_06="#611FCE"           # Magenta (Syntax var)
export COLOR_07="#0F9CFD"           # Cyan (Prompt)
export COLOR_08="#515151"           # White

export COLOR_09="#B5B4B6"           # Bright Black
export COLOR_10="#FE3E31"           # Bright Red (Command error)
export COLOR_11="#47F74C"           # Bright Green (Exec)
export COLOR_12="#F7E203"           # Bright Yellow
export COLOR_13="#2931DF"           # Bright Blue (Folder)
export COLOR_14="#611FCE"           # Bright Magenta
export COLOR_15="#0F9CFD"           # Bright Cyan
export COLOR_16="#2D2C2C"           # Bright White

export BACKGROUND_COLOR="#F1ECF1"   # Background
export FOREGROUND_COLOR="#515151"   # Foreground (Text)

export CURSOR_COLOR="#515151" # Cursor

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
