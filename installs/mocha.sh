#!/usr/bin/env bash

export PROFILE_NAME="Mocha"

export COLOR_01="#3B3228"           # Black (Host)
export COLOR_02="#CB6077"           # Red (Syntax string)
export COLOR_03="#BEB55B"           # Green (Command)
export COLOR_04="#F4BC87"           # Yellow (Command second)
export COLOR_05="#8AB3B5"           # Blue (Path)
export COLOR_06="#A89BB9"           # Magenta (Syntax var)
export COLOR_07="#7BBDA4"           # Cyan (Prompt)
export COLOR_08="#D0C8C6"           # White

export COLOR_09="#7E705A"           # Bright Black
export COLOR_10="#CB6077"           # Bright Red (Command error)
export COLOR_11="#BEB55B"           # Bright Green (Exec)
export COLOR_12="#F4BC87"           # Bright Yellow
export COLOR_13="#8AB3B5"           # Bright Blue (Folder)
export COLOR_14="#A89BB9"           # Bright Magenta
export COLOR_15="#7BBDA4"           # Bright Cyan
export COLOR_16="#F5EEEB"           # Bright White

export BACKGROUND_COLOR="#3B3228"   # Background
export FOREGROUND_COLOR="#D0C8C6"   # Foreground (Text)

export CURSOR_COLOR="#D0C8C6" # Cursor

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
