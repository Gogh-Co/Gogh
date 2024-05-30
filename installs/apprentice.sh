#!/usr/bin/env bash

export PROFILE_NAME="Apprentice"

export COLOR_01="#1C1C1C"           # Black (Host)
export COLOR_02="#AF5F5F"           # Red (Syntax string)
export COLOR_03="#5F875F"           # Green (Command)
export COLOR_04="#87875F"           # Yellow (Command second)
export COLOR_05="#5F87AF"           # Blue (Path)
export COLOR_06="#5F5F87"           # Magenta (Syntax var)
export COLOR_07="#5F8787"           # Cyan (Prompt)
export COLOR_08="#6C6C6C"           # White

export COLOR_09="#444444"           # Bright Black
export COLOR_10="#FF8700"           # Bright Red (Command error)
export COLOR_11="#87AF87"           # Bright Green (Exec)
export COLOR_12="#FFFFAF"           # Bright Yellow
export COLOR_13="#8FAFD7"           # Bright Blue (Folder)
export COLOR_14="#8787AF"           # Bright Magenta
export COLOR_15="#5FAFAF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#262626"   # Background
export FOREGROUND_COLOR="#BCBCBC"   # Foreground (Text)

export CURSOR_COLOR="#BCBCBC" # Cursor

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
