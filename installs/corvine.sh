#!/usr/bin/env bash

export PROFILE_NAME="Corvine"

export COLOR_01="#3A3A3A"           # Black (Host)
export COLOR_02="#D78787"           # Red (Syntax string)
export COLOR_03="#87AF5F"           # Green (Command)
export COLOR_04="#D7D7AF"           # Yellow (Command second)
export COLOR_05="#87AFD7"           # Blue (Path)
export COLOR_06="#AFAFD7"           # Magenta (Syntax var)
export COLOR_07="#87D7D7"           # Cyan (Prompt)
export COLOR_08="#C6C6C6"           # White

export COLOR_09="#626262"           # Bright Black
export COLOR_10="#FFAFAF"           # Bright Red (Command error)
export COLOR_11="#AFD787"           # Bright Green (Exec)
export COLOR_12="#D7D787"           # Bright Yellow
export COLOR_13="#87D7FF"           # Bright Blue (Folder)
export COLOR_14="#D7AFD7"           # Bright Magenta
export COLOR_15="#5FD7D7"           # Bright Cyan
export COLOR_16="#EEEEEE"           # Bright White

export BACKGROUND_COLOR="#262626"   # Background
export FOREGROUND_COLOR="#C6C6C6"   # Foreground (Text)

export CURSOR_COLOR="#C6C6C6" # Cursor

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
