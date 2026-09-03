#!/usr/bin/env bash

export PROFILE_NAME="Subliminal"

export COLOR_01="#7F7F7F"           # Black (Host)
export COLOR_02="#E15A60"           # Red (Syntax string)
export COLOR_03="#A9CFA4"           # Green (Command)
export COLOR_04="#FFE2A9"           # Yellow (Command second)
export COLOR_05="#6699CC"           # Blue (Path)
export COLOR_06="#F1A5AB"           # Magenta (Syntax var)
export COLOR_07="#5FB3B3"           # Cyan (Prompt)
export COLOR_08="#D4D4D4"           # White

export COLOR_09="#7F7F7F"           # Bright Black
export COLOR_10="#E15A60"           # Bright Red (Command error)
export COLOR_11="#A9CFA4"           # Bright Green (Exec)
export COLOR_12="#FFE2A9"           # Bright Yellow
export COLOR_13="#6699CC"           # Bright Blue (Folder)
export COLOR_14="#F1A5AB"           # Bright Magenta
export COLOR_15="#5FB3B3"           # Bright Cyan
export COLOR_16="#D4D4D4"           # Bright White

export BACKGROUND_COLOR="#282C35"   # Background
export FOREGROUND_COLOR="#D4D4D4"   # Foreground (Text)

export CURSOR_COLOR="#C7C7C7" # Cursor

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
