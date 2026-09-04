#!/usr/bin/env bash

export PROFILE_NAME="Saga"

export COLOR_01="#05080A"           # Black (Host)
export COLOR_02="#FFD4E9"           # Red (Syntax string)
export COLOR_03="#F7DDFF"           # Green (Command)
export COLOR_04="#FBEBC8"           # Yellow (Command second)
export COLOR_05="#C9FFF7"           # Blue (Path)
export COLOR_06="#DCC3F9"           # Magenta (Syntax var)
export COLOR_07="#C5EDC1"           # Cyan (Prompt)
export COLOR_08="#DCE2F7"           # White

export COLOR_09="#141F27"           # Bright Black
export COLOR_10="#FFD4E9"           # Bright Red (Command error)
export COLOR_11="#F7DDFF"           # Bright Green (Exec)
export COLOR_12="#FBEBC8"           # Bright Yellow
export COLOR_13="#C9FFF7"           # Bright Blue (Folder)
export COLOR_14="#DCC3F9"           # Bright Magenta
export COLOR_15="#C5EDC1"           # Bright Cyan
export COLOR_16="#CCD3FE"           # Bright White

export BACKGROUND_COLOR="#05080A"   # Background
export FOREGROUND_COLOR="#DCE2F7"   # Foreground (Text)

export CURSOR_COLOR="#DCE2F7" # Cursor

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
