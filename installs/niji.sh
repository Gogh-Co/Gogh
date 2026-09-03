#!/usr/bin/env bash

export PROFILE_NAME="Niji"

export COLOR_01="#333333"           # Black (Host)
export COLOR_02="#D23E08"           # Red (Syntax string)
export COLOR_03="#54CA74"           # Green (Command)
export COLOR_04="#FFF700"           # Yellow (Command second)
export COLOR_05="#2AB9FF"           # Blue (Path)
export COLOR_06="#FF50DA"           # Magenta (Syntax var)
export COLOR_07="#1EF9F5"           # Cyan (Prompt)
export COLOR_08="#DDD0C4"           # White

export COLOR_09="#515151"           # Bright Black
export COLOR_10="#FFB7B7"           # Bright Red (Command error)
export COLOR_11="#C1FFAE"           # Bright Green (Exec)
export COLOR_12="#FCFFB8"           # Bright Yellow
export COLOR_13="#8EFFF3"           # Bright Blue (Folder)
export COLOR_14="#FFA2ED"           # Bright Magenta
export COLOR_15="#BCFFC7"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#141515"   # Background
export FOREGROUND_COLOR="#FFFFFF"   # Foreground (Text)

export CURSOR_COLOR="#FFC663" # Cursor

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
