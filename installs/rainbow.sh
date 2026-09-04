#!/usr/bin/env bash

export PROFILE_NAME="Rainbow"

export COLOR_01="#5B4375"           # Black (Host)
export COLOR_02="#426BB6"           # Red (Syntax string)
export COLOR_03="#2286B5"           # Green (Command)
export COLOR_04="#5AB782"           # Yellow (Command second)
export COLOR_05="#93CA5B"           # Blue (Path)
export COLOR_06="#C6C842"           # Magenta (Syntax var)
export COLOR_07="#8A5135"           # Cyan (Prompt)
export COLOR_08="#C54646"           # White

export COLOR_09="#5B4375"           # Bright Black
export COLOR_10="#426BB6"           # Bright Red (Command error)
export COLOR_11="#2286B5"           # Bright Green (Exec)
export COLOR_12="#5AB782"           # Bright Yellow
export COLOR_13="#93CA5B"           # Bright Blue (Folder)
export COLOR_14="#C6C842"           # Bright Magenta
export COLOR_15="#8A5135"           # Bright Cyan
export COLOR_16="#C54646"           # Bright White

export BACKGROUND_COLOR="#192835"   # Background
export FOREGROUND_COLOR="#AADA4F"   # Foreground (Text)

export CURSOR_COLOR="#AADA4F" # Cursor

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
