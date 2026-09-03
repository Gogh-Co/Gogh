#!/usr/bin/env bash

export PROFILE_NAME="Retro Legends"

export COLOR_01="#262626"           # Black (Host)
export COLOR_02="#DE5454"           # Red (Syntax string)
export COLOR_03="#45EB45"           # Green (Command)
export COLOR_04="#F7BF2B"           # Yellow (Command second)
export COLOR_05="#4066F2"           # Blue (Path)
export COLOR_06="#BF4CF2"           # Magenta (Syntax var)
export COLOR_07="#40D9E6"           # Cyan (Prompt)
export COLOR_08="#BFE6BF"           # White

export COLOR_09="#4C594C"           # Bright Black
export COLOR_10="#FF6666"           # Bright Red (Command error)
export COLOR_11="#59FF59"           # Bright Green (Exec)
export COLOR_12="#FFD933"           # Bright Yellow
export COLOR_13="#4C80FF"           # Bright Blue (Folder)
export COLOR_14="#E666FF"           # Bright Magenta
export COLOR_15="#59E6FF"           # Bright Cyan
export COLOR_16="#F2FFF2"           # Bright White

export BACKGROUND_COLOR="#0D0D0D"   # Background
export FOREGROUND_COLOR="#45EB45"   # Foreground (Text)

export CURSOR_COLOR="#45EB45" # Cursor

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
