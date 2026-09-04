#!/usr/bin/env bash

export PROFILE_NAME="Tokyo City Terminal Light"

export COLOR_01="#FBFBFD"           # Black (Host)
export COLOR_02="#8C4351"           # Red (Syntax string)
export COLOR_03="#33635C"           # Green (Command)
export COLOR_04="#8F5E15"           # Yellow (Command second)
export COLOR_05="#34548A"           # Blue (Path)
export COLOR_06="#5A4A78"           # Magenta (Syntax var)
export COLOR_07="#0F4B6E"           # Cyan (Prompt)
export COLOR_08="#28323A"           # White

export COLOR_09="#B7C5D3"           # Bright Black
export COLOR_10="#8C4351"           # Bright Red (Command error)
export COLOR_11="#33635C"           # Bright Green (Exec)
export COLOR_12="#8F5E15"           # Bright Yellow
export COLOR_13="#34548A"           # Bright Blue (Folder)
export COLOR_14="#5A4A78"           # Bright Magenta
export COLOR_15="#0F4B6E"           # Bright Cyan
export COLOR_16="#171D23"           # Bright White

export BACKGROUND_COLOR="#FBFBFD"   # Background
export FOREGROUND_COLOR="#28323A"   # Foreground (Text)

export CURSOR_COLOR="#28323A" # Cursor

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
