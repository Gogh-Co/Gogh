#!/usr/bin/env bash

export PROFILE_NAME="Serendipity Sunset"

export COLOR_01="#363847"           # Black (Host)
export COLOR_02="#D1918F"           # Red (Syntax string)
export COLOR_03="#709BBD"           # Green (Command)
export COLOR_04="#A392DC"           # Yellow (Command second)
export COLOR_05="#A0B6E8"           # Blue (Path)
export COLOR_06="#AAC9D4"           # Magenta (Syntax var)
export COLOR_07="#D6B4B4"           # Cyan (Prompt)
export COLOR_08="#DEE0EF"           # White

export COLOR_09="#6B6D7C"           # Bright Black
export COLOR_10="#D1918F"           # Bright Red (Command error)
export COLOR_11="#709BBD"           # Bright Green (Exec)
export COLOR_12="#A392DC"           # Bright Yellow
export COLOR_13="#A0B6E8"           # Bright Blue (Folder)
export COLOR_14="#AAC9D4"           # Bright Magenta
export COLOR_15="#D6B4B4"           # Bright Cyan
export COLOR_16="#DEE0EF"           # Bright White

export BACKGROUND_COLOR="#202231"   # Background
export FOREGROUND_COLOR="#DEE0EF"   # Foreground (Text)

export CURSOR_COLOR="#8D8F9E" # Cursor

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
