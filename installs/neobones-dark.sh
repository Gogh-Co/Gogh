#!/usr/bin/env bash

export PROFILE_NAME="Neobones Dark"

export COLOR_01="#0F191F"           # Black (Host)
export COLOR_02="#DE6E7C"           # Red (Syntax string)
export COLOR_03="#90FF6B"           # Green (Command)
export COLOR_04="#B77E64"           # Yellow (Command second)
export COLOR_05="#8190D4"           # Blue (Path)
export COLOR_06="#B279A7"           # Magenta (Syntax var)
export COLOR_07="#66A5AD"           # Cyan (Prompt)
export COLOR_08="#C6D5CF"           # White

export COLOR_09="#263945"           # Bright Black
export COLOR_10="#E8838F"           # Bright Red (Command error)
export COLOR_11="#A0FF85"           # Bright Green (Exec)
export COLOR_12="#D68C67"           # Bright Yellow
export COLOR_13="#92A0E2"           # Bright Blue (Folder)
export COLOR_14="#CF86C1"           # Bright Magenta
export COLOR_15="#65B8C1"           # Bright Cyan
export COLOR_16="#98A39E"           # Bright White

export BACKGROUND_COLOR="#0F191F"   # Background
export FOREGROUND_COLOR="#C6D5CF"   # Foreground (Text)

export CURSOR_COLOR="#CEDDD7" # Cursor

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
