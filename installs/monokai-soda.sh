#!/usr/bin/env bash

export PROFILE_NAME="Monokai Soda"

export COLOR_01="#1A1A1A"           # Black (Host)
export COLOR_02="#F4005F"           # Red (Syntax string)
export COLOR_03="#98E024"           # Green (Command)
export COLOR_04="#FA8419"           # Yellow (Command second)
export COLOR_05="#9D65FF"           # Blue (Path)
export COLOR_06="#F4005F"           # Magenta (Syntax var)
export COLOR_07="#58D1EB"           # Cyan (Prompt)
export COLOR_08="#C4C5B5"           # White

export COLOR_09="#625E4C"           # Bright Black
export COLOR_10="#F4005F"           # Bright Red (Command error)
export COLOR_11="#98E024"           # Bright Green (Exec)
export COLOR_12="#E0D561"           # Bright Yellow
export COLOR_13="#9D65FF"           # Bright Blue (Folder)
export COLOR_14="#F4005F"           # Bright Magenta
export COLOR_15="#58D1EB"           # Bright Cyan
export COLOR_16="#F6F6EF"           # Bright White

export BACKGROUND_COLOR="#1A1A1A"   # Background
export FOREGROUND_COLOR="#C4C5B5"   # Foreground (Text)

export CURSOR_COLOR="#C4C5B5" # Cursor

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
