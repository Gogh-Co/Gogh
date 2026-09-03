#!/usr/bin/env bash

export PROFILE_NAME="Catppuccin Frappe"

export COLOR_01="#51576D"           # Black (Host)
export COLOR_02="#E78284"           # Red (Syntax string)
export COLOR_03="#A6D189"           # Green (Command)
export COLOR_04="#E5C890"           # Yellow (Command second)
export COLOR_05="#8CAAEE"           # Blue (Path)
export COLOR_06="#F4B8E4"           # Magenta (Syntax var)
export COLOR_07="#81C8BE"           # Cyan (Prompt)
export COLOR_08="#A5ADCE"           # White

export COLOR_09="#626880"           # Bright Black
export COLOR_10="#E67172"           # Bright Red (Command error)
export COLOR_11="#8EC772"           # Bright Green (Exec)
export COLOR_12="#D9BA73"           # Bright Yellow
export COLOR_13="#7B9EF0"           # Bright Blue (Folder)
export COLOR_14="#F2A4DB"           # Bright Magenta
export COLOR_15="#5ABFB5"           # Bright Cyan
export COLOR_16="#B5BFE2"           # Bright White

export BACKGROUND_COLOR="#303446"   # Background
export FOREGROUND_COLOR="#C6D0F5"   # Foreground (Text)

export CURSOR_COLOR="#F2D5CF" # Cursor

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
