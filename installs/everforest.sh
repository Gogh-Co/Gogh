#!/usr/bin/env bash

export PROFILE_NAME="Everforest"

export COLOR_01="#2D353B"           # Black (Host)
export COLOR_02="#E67E80"           # Red (Syntax string)
export COLOR_03="#A7C080"           # Green (Command)
export COLOR_04="#DBBC7F"           # Yellow (Command second)
export COLOR_05="#7FBBB3"           # Blue (Path)
export COLOR_06="#D699B6"           # Magenta (Syntax var)
export COLOR_07="#83C092"           # Cyan (Prompt)
export COLOR_08="#D3C6AA"           # White

export COLOR_09="#859289"           # Bright Black
export COLOR_10="#E67E80"           # Bright Red (Command error)
export COLOR_11="#A7C080"           # Bright Green (Exec)
export COLOR_12="#DBBC7F"           # Bright Yellow
export COLOR_13="#7FBBB3"           # Bright Blue (Folder)
export COLOR_14="#D699B6"           # Bright Magenta
export COLOR_15="#83C092"           # Bright Cyan
export COLOR_16="#FDF6E3"           # Bright White

export BACKGROUND_COLOR="#2D353B"   # Background
export FOREGROUND_COLOR="#D3C6AA"   # Foreground (Text)

export CURSOR_COLOR="#D3C6AA" # Cursor

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
