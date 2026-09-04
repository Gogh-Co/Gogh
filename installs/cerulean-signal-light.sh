#!/usr/bin/env bash

export PROFILE_NAME="Cerulean Signal Light"

export COLOR_01="#F7F9FC"           # Black (Host)
export COLOR_02="#B4233D"           # Red (Syntax string)
export COLOR_03="#17795E"           # Green (Command)
export COLOR_04="#6F6300"           # Yellow (Command second)
export COLOR_05="#006FA8"           # Blue (Path)
export COLOR_06="#A0007D"           # Magenta (Syntax var)
export COLOR_07="#00727E"           # Cyan (Prompt)
export COLOR_08="#232B38"           # White

export COLOR_09="#637287"           # Bright Black
export COLOR_10="#C7354D"           # Bright Red (Command error)
export COLOR_11="#247B4E"           # Bright Green (Exec)
export COLOR_12="#7B6500"           # Bright Yellow
export COLOR_13="#0078B5"           # Bright Blue (Folder)
export COLOR_14="#B5149E"           # Bright Magenta
export COLOR_15="#007787"           # Bright Cyan
export COLOR_16="#141D2A"           # Bright White

export BACKGROUND_COLOR="#F7F9FC"   # Background
export FOREGROUND_COLOR="#232B38"   # Foreground (Text)

export CURSOR_COLOR="#232B38" # Cursor

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
