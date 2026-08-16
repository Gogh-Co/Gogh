#!/usr/bin/env bash

export PROFILE_NAME="Agave"

export COLOR_01="#222826"           # Black (Host)
export COLOR_02="#A35D4E"           # Red (Syntax string)
export COLOR_03="#6E9E75"           # Green (Command)
export COLOR_04="#C8A962"           # Yellow (Command second)
export COLOR_05="#5F8E97"           # Blue (Path)
export COLOR_06="#89739A"           # Magenta (Syntax var)
export COLOR_07="#6EA7A3"           # Cyan (Prompt)
export COLOR_08="#C8D5CC"           # White

export COLOR_09="#5A6661"           # Bright Black
export COLOR_10="#C97867"           # Bright Red (Command error)
export COLOR_11="#96C79C"           # Bright Green (Exec)
export COLOR_12="#E6CF8A"           # Bright Yellow
export COLOR_13="#8FBBC3"           # Bright Blue (Folder)
export COLOR_14="#B49AC8"           # Bright Magenta
export COLOR_15="#9ED4CF"           # Bright Cyan
export COLOR_16="#F6FBF5"           # Bright White

export BACKGROUND_COLOR="#141917"   # Background
export FOREGROUND_COLOR="#D8E3DA"   # Foreground (Text)

export CURSOR_COLOR="#EAF5D6" # Cursor

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
