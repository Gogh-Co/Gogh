#!/usr/bin/env bash

export PROFILE_NAME="Tempus Autumn"

export COLOR_01="#302420"           # Black (Host)
export COLOR_02="#F46F55"           # Red (Syntax string)
export COLOR_03="#85A400"           # Green (Command)
export COLOR_04="#B09640"           # Yellow (Command second)
export COLOR_05="#799ACA"           # Blue (Path)
export COLOR_06="#DF798E"           # Magenta (Syntax var)
export COLOR_07="#52A885"           # Cyan (Prompt)
export COLOR_08="#A8948A"           # White

export COLOR_09="#36302A"           # Bright Black
export COLOR_10="#E27E3D"           # Bright Red (Command error)
export COLOR_11="#43AA7A"           # Bright Green (Exec)
export COLOR_12="#BA9400"           # Bright Yellow
export COLOR_13="#958FDF"           # Bright Blue (Folder)
export COLOR_14="#CE7DC4"           # Bright Magenta
export COLOR_15="#2FA6B7"           # Bright Cyan
export COLOR_16="#A9A2A6"           # Bright White

export BACKGROUND_COLOR="#302420"   # Background
export FOREGROUND_COLOR="#A9A2A6"   # Foreground (Text)

export CURSOR_COLOR="#A9A2A6" # Cursor

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
