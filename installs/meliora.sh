#!/usr/bin/env bash

export PROFILE_NAME="Meliora"

export COLOR_01="#2A2421"           # Black (Host)
export COLOR_02="#D49191"           # Red (Syntax string)
export COLOR_03="#B6B696"           # Green (Command)
export COLOR_04="#C4B392"           # Yellow (Command second)
export COLOR_05="#9E96B6"           # Blue (Path)
export COLOR_06="#B696B1"           # Magenta (Syntax var)
export COLOR_07="#98ACC8"           # Cyan (Prompt)
export COLOR_08="#DDD9D6"           # White

export COLOR_09="#2E2622"           # Bright Black
export COLOR_10="#D89393"           # Bright Red (Command error)
export COLOR_11="#B9B99B"           # Bright Green (Exec)
export COLOR_12="#C8B692"           # Bright Yellow
export COLOR_13="#A299B9"           # Bright Blue (Folder)
export COLOR_14="#B997B4"           # Bright Magenta
export COLOR_15="#9BB0CA"           # Bright Cyan
export COLOR_16="#E1DBD9"           # Bright White

export BACKGROUND_COLOR="#1C1917"   # Background
export FOREGROUND_COLOR="#D6D0CD"   # Foreground (Text)

export CURSOR_COLOR="#D6D0CD" # Cursor

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
