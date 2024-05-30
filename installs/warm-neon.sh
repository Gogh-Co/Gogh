#!/usr/bin/env bash

export PROFILE_NAME="Warm Neon"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#E24346"           # Red (Syntax string)
export COLOR_03="#39B13A"           # Green (Command)
export COLOR_04="#DAE145"           # Yellow (Command second)
export COLOR_05="#4261C5"           # Blue (Path)
export COLOR_06="#F920FB"           # Magenta (Syntax var)
export COLOR_07="#2ABBD4"           # Cyan (Prompt)
export COLOR_08="#D0B8A3"           # White

export COLOR_09="#FEFCFC"           # Bright Black
export COLOR_10="#E97071"           # Bright Red (Command error)
export COLOR_11="#9CC090"           # Bright Green (Exec)
export COLOR_12="#DDDA7A"           # Bright Yellow
export COLOR_13="#7B91D6"           # Bright Blue (Folder)
export COLOR_14="#F674BA"           # Bright Magenta
export COLOR_15="#5ED1E5"           # Bright Cyan
export COLOR_16="#D8C8BB"           # Bright White

export BACKGROUND_COLOR="#404040"   # Background
export FOREGROUND_COLOR="#AFDAB6"   # Foreground (Text)

export CURSOR_COLOR="#AFDAB6" # Cursor

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
