#!/usr/bin/env bash

export PROFILE_NAME="Poimandres Darker"

export COLOR_01="#16161E"           # Black (Host)
export COLOR_02="#D0679D"           # Red (Syntax string)
export COLOR_03="#5DE4C7"           # Green (Command)
export COLOR_04="#FFFAC2"           # Yellow (Command second)
export COLOR_05="#89DDFF"           # Blue (Path)
export COLOR_06="#FCC5E9"           # Magenta (Syntax var)
export COLOR_07="#ADD7FF"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#A6ACCD"           # Bright Black
export COLOR_10="#D0679D"           # Bright Red (Command error)
export COLOR_11="#5DE4C7"           # Bright Green (Exec)
export COLOR_12="#FFFAC2"           # Bright Yellow
export COLOR_13="#ADD7FF"           # Bright Blue (Folder)
export COLOR_14="#FAE4FC"           # Bright Magenta
export COLOR_15="#89DDFF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#16161E"   # Background
export FOREGROUND_COLOR="#A6ACCD"   # Foreground (Text)

export CURSOR_COLOR="#FFFFFF" # Cursor

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
