#!/usr/bin/env bash

export PROFILE_NAME="Arc Dark"

export COLOR_01="#0D1117"           # Black (Host)
export COLOR_02="#C32424"           # Red (Syntax string)
export COLOR_03="#24C391"           # Green (Command)
export COLOR_04="#C3A924"           # Yellow (Command second)
export COLOR_05="#2455C3"           # Blue (Path)
export COLOR_06="#C224C3"           # Magenta (Syntax var)
export COLOR_07="#24BAC3"           # Cyan (Prompt)
export COLOR_08="#E8ECF2"           # White

export COLOR_09="#3B4D68"           # Bright Black
export COLOR_10="#D93030"           # Bright Red (Command error)
export COLOR_11="#30D9A4"           # Bright Green (Exec)
export COLOR_12="#D9BD30"           # Bright Yellow
export COLOR_13="#3063D9"           # Bright Blue (Folder)
export COLOR_14="#D930D9"           # Bright Magenta
export COLOR_15="#30D1D9"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#0D1117"   # Background
export FOREGROUND_COLOR="#9198A1"   # Foreground (Text)

export CURSOR_COLOR="#00FF00" # Cursor

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
