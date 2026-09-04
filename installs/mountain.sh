#!/usr/bin/env bash

export PROFILE_NAME="Mountain"

export COLOR_01="#0F0F0F"           # Black (Host)
export COLOR_02="#AC8A8C"           # Red (Syntax string)
export COLOR_03="#8AAC8B"           # Green (Command)
export COLOR_04="#ACA98A"           # Yellow (Command second)
export COLOR_05="#8F8AAC"           # Blue (Path)
export COLOR_06="#AC8AAC"           # Magenta (Syntax var)
export COLOR_07="#8AABAC"           # Cyan (Prompt)
export COLOR_08="#CACACA"           # White

export COLOR_09="#393939"           # Bright Black
export COLOR_10="#C49EA0"           # Bright Red (Command error)
export COLOR_11="#9EC49F"           # Bright Green (Exec)
export COLOR_12="#C4C19E"           # Bright Yellow
export COLOR_13="#A39EC4"           # Bright Blue (Folder)
export COLOR_14="#C49EC4"           # Bright Magenta
export COLOR_15="#9EC3C4"           # Bright Cyan
export COLOR_16="#F0F0F0"           # Bright White

export BACKGROUND_COLOR="#0F0F0F"   # Background
export FOREGROUND_COLOR="#CACACA"   # Foreground (Text)

export CURSOR_COLOR="#CACACA" # Cursor

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
