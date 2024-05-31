#!/usr/bin/env bash

export PROFILE_NAME="Everforest Light Soft"

export COLOR_01="#5C6A72"           # Black (Host)
export COLOR_02="#F85552"           # Red (Syntax string)
export COLOR_03="#8DA101"           # Green (Command)
export COLOR_04="#DFA000"           # Yellow (Command second)
export COLOR_05="#3A94C5"           # Blue (Path)
export COLOR_06="#DF69BA"           # Magenta (Syntax var)
export COLOR_07="#35A77C"           # Cyan (Prompt)
export COLOR_08="#DFDDC8"           # White

export COLOR_09="#3A464C"           # Bright Black
export COLOR_10="#E67E80"           # Bright Red (Command error)
export COLOR_11="#A7C080"           # Bright Green (Exec)
export COLOR_12="#DBBC7F"           # Bright Yellow
export COLOR_13="#7FBBB3"           # Bright Blue (Folder)
export COLOR_14="#D699B6"           # Bright Magenta
export COLOR_15="#83C092"           # Bright Cyan
export COLOR_16="#D3C6AA"           # Bright White

export BACKGROUND_COLOR="#F3EAD3"   # Background
export FOREGROUND_COLOR="#5C6A72"   # Foreground (Text)

export CURSOR_COLOR="#5C6A72" # Cursor

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
