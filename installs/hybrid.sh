#!/usr/bin/env bash

export PROFILE_NAME="Hybrid"

export COLOR_01="#282A2E"           # Black (Host)
export COLOR_02="#A54242"           # Red (Syntax string)
export COLOR_03="#8C9440"           # Green (Command)
export COLOR_04="#DE935F"           # Yellow (Command second)
export COLOR_05="#5F819D"           # Blue (Path)
export COLOR_06="#85678F"           # Magenta (Syntax var)
export COLOR_07="#5E8D87"           # Cyan (Prompt)
export COLOR_08="#969896"           # White

export COLOR_09="#373B41"           # Bright Black
export COLOR_10="#CC6666"           # Bright Red (Command error)
export COLOR_11="#B5BD68"           # Bright Green (Exec)
export COLOR_12="#F0C674"           # Bright Yellow
export COLOR_13="#81A2BE"           # Bright Blue (Folder)
export COLOR_14="#B294BB"           # Bright Magenta
export COLOR_15="#8ABEB7"           # Bright Cyan
export COLOR_16="#C5C8C6"           # Bright White

export BACKGROUND_COLOR="#141414"   # Background
export FOREGROUND_COLOR="#94A3A5"   # Foreground (Text)

export CURSOR_COLOR="#94A3A5" # Cursor

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
