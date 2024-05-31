#!/usr/bin/env bash

export PROFILE_NAME="Spring"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#FF4D83"           # Red (Syntax string)
export COLOR_03="#1F8C3B"           # Green (Command)
export COLOR_04="#1FC95B"           # Yellow (Command second)
export COLOR_05="#1DD3EE"           # Blue (Path)
export COLOR_06="#8959A8"           # Magenta (Syntax var)
export COLOR_07="#3E999F"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#000000"           # Bright Black
export COLOR_10="#FF0021"           # Bright Red (Command error)
export COLOR_11="#1FC231"           # Bright Green (Exec)
export COLOR_12="#D5B807"           # Bright Yellow
export COLOR_13="#15A9FD"           # Bright Blue (Folder)
export COLOR_14="#8959A8"           # Bright Magenta
export COLOR_15="#3E999F"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#0A1E24"   # Background
export FOREGROUND_COLOR="#ECF0C1"   # Foreground (Text)

export CURSOR_COLOR="#ECF0C1" # Cursor

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
