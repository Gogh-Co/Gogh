#!/usr/bin/env bash

export PROFILE_NAME="Karma Dark Dimmed"

export COLOR_01="#14181F"           # Black (Host)
export COLOR_02="#E87691"           # Red (Syntax string)
export COLOR_03="#82C891"           # Green (Command)
export COLOR_04="#EBD870"           # Yellow (Command second)
export COLOR_05="#6CC4D2"           # Blue (Path)
export COLOR_06="#A892D4"           # Magenta (Syntax var)
export COLOR_07="#6CC4D2"           # Cyan (Prompt)
export COLOR_08="#A8A4AE"           # White

export COLOR_09="#5C5A5F"           # Bright Black
export COLOR_10="#E8869C"           # Bright Red (Command error)
export COLOR_11="#98CEA4"           # Bright Green (Exec)
export COLOR_12="#EBD870"           # Bright Yellow
export COLOR_13="#80C8D2"           # Bright Blue (Folder)
export COLOR_14="#B6A4D6"           # Bright Magenta
export COLOR_15="#80C8D2"           # Bright Cyan
export COLOR_16="#E2DEF0"           # Bright White

export BACKGROUND_COLOR="#14181F"   # Background
export FOREGROUND_COLOR="#E2DEF0"   # Foreground (Text)

export CURSOR_COLOR="#EBD870" # Cursor

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
