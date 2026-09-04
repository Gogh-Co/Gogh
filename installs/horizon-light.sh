#!/usr/bin/env bash

export PROFILE_NAME="Horizon Light"

export COLOR_01="#FDF0ED"           # Black (Host)
export COLOR_02="#F7939B"           # Red (Syntax string)
export COLOR_03="#94E1B0"           # Green (Command)
export COLOR_04="#FBE0D9"           # Yellow (Command second)
export COLOR_05="#DA103F"           # Blue (Path)
export COLOR_06="#1D8991"           # Magenta (Syntax var)
export COLOR_07="#DC3318"           # Cyan (Prompt)
export COLOR_08="#403C3D"           # White

export COLOR_09="#BDB3B1"           # Bright Black
export COLOR_10="#F7939B"           # Bright Red (Command error)
export COLOR_11="#94E1B0"           # Bright Green (Exec)
export COLOR_12="#FBE0D9"           # Bright Yellow
export COLOR_13="#DA103F"           # Bright Blue (Folder)
export COLOR_14="#1D8991"           # Bright Magenta
export COLOR_15="#DC3318"           # Bright Cyan
export COLOR_16="#201C1D"           # Bright White

export BACKGROUND_COLOR="#FDF0ED"   # Background
export FOREGROUND_COLOR="#403C3D"   # Foreground (Text)

export CURSOR_COLOR="#403C3D" # Cursor

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
