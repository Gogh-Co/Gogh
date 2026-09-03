#!/usr/bin/env bash

export PROFILE_NAME="Melange Light"

export COLOR_01="#E9E1DB"           # Black (Host)
export COLOR_02="#C77B8B"           # Red (Syntax string)
export COLOR_03="#6E9B72"           # Green (Command)
export COLOR_04="#BC5C00"           # Yellow (Command second)
export COLOR_05="#7892BD"           # Blue (Path)
export COLOR_06="#BE79BB"           # Magenta (Syntax var)
export COLOR_07="#739797"           # Cyan (Prompt)
export COLOR_08="#7D6658"           # White

export COLOR_09="#A98A78"           # Bright Black
export COLOR_10="#BF0021"           # Bright Red (Command error)
export COLOR_11="#3A684A"           # Bright Green (Exec)
export COLOR_12="#A06D00"           # Bright Yellow
export COLOR_13="#465AA4"           # Bright Blue (Folder)
export COLOR_14="#904180"           # Bright Magenta
export COLOR_15="#3D6568"           # Bright Cyan
export COLOR_16="#54433A"           # Bright White

export BACKGROUND_COLOR="#F1F1F1"   # Background
export FOREGROUND_COLOR="#54433A"   # Foreground (Text)

export CURSOR_COLOR="#54433A" # Cursor

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
