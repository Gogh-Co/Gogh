#!/usr/bin/env bash

export PROFILE_NAME="Taerminal"

export COLOR_01="#26282A"           # Black (Host)
export COLOR_02="#FF8878"           # Red (Syntax string)
export COLOR_03="#B4FB73"           # Green (Command)
export COLOR_04="#FFFCB7"           # Yellow (Command second)
export COLOR_05="#8BBCE5"           # Blue (Path)
export COLOR_06="#FFB2FE"           # Magenta (Syntax var)
export COLOR_07="#A2E1F8"           # Cyan (Prompt)
export COLOR_08="#F1F1F1"           # White

export COLOR_09="#6F6F6F"           # Bright Black
export COLOR_10="#FE978B"           # Bright Red (Command error)
export COLOR_11="#D6FCBA"           # Bright Green (Exec)
export COLOR_12="#FFFED5"           # Bright Yellow
export COLOR_13="#C2E3FF"           # Bright Blue (Folder)
export COLOR_14="#FFC6FF"           # Bright Magenta
export COLOR_15="#C0E9F8"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#26282A"   # Background
export FOREGROUND_COLOR="#F0F0F0"   # Foreground (Text)

export CURSOR_COLOR="#F0F0F0" # Cursor

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
