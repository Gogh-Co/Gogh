#!/usr/bin/env bash

export PROFILE_NAME="Cherry"

export COLOR_01="#43435A"           # Black (Host)
export COLOR_02="#FF568E"           # Red (Syntax string)
export COLOR_03="#64DE83"           # Green (Command)
export COLOR_04="#EFFF73"           # Yellow (Command second)
export COLOR_05="#73A9FF"           # Blue (Path)
export COLOR_06="#946FF7"           # Magenta (Syntax var)
export COLOR_07="#62C6DA"           # Cyan (Prompt)
export COLOR_08="#DEDEFF"           # White

export COLOR_09="#53536B"           # Bright Black
export COLOR_10="#FF69A2"           # Bright Red (Command error)
export COLOR_11="#73DE8A"           # Bright Green (Exec)
export COLOR_12="#F3FF85"           # Bright Yellow
export COLOR_13="#85B6FF"           # Bright Blue (Folder)
export COLOR_14="#A481F7"           # Bright Magenta
export COLOR_15="#71C2D9"           # Bright Cyan
export COLOR_16="#EBEBFF"           # Bright White

export BACKGROUND_COLOR="#1F1F2A"   # Background
export FOREGROUND_COLOR="#BDC3DF"   # Foreground (Text)

export CURSOR_COLOR="#BDC3DF" # Cursor

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
