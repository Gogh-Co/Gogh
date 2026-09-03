#!/usr/bin/env bash

export PROFILE_NAME="Frostbyte"

export COLOR_01="#283645"           # Black (Host)
export COLOR_02="#C2384F"           # Red (Syntax string)
export COLOR_03="#2E7A56"           # Green (Command)
export COLOR_04="#876010"           # Yellow (Command second)
export COLOR_05="#1A66BE"           # Blue (Path)
export COLOR_06="#5552CC"           # Magenta (Syntax var)
export COLOR_07="#1A7E9E"           # Cyan (Prompt)
export COLOR_08="#586878"           # White

export COLOR_09="#93A4B6"           # Bright Black
export COLOR_10="#C2384F"           # Bright Red (Command error)
export COLOR_11="#2E7A56"           # Bright Green (Exec)
export COLOR_12="#9A5220"           # Bright Yellow
export COLOR_13="#1A66BE"           # Bright Blue (Folder)
export COLOR_14="#5552CC"           # Bright Magenta
export COLOR_15="#1A7E9E"           # Bright Cyan
export COLOR_16="#283645"           # Bright White

export BACKGROUND_COLOR="#EEF5FC"   # Background
export FOREGROUND_COLOR="#283645"   # Foreground (Text)

export CURSOR_COLOR="#1F73CC" # Cursor

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
