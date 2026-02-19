#!/usr/bin/env bash

export PROFILE_NAME="Moonfly"

export COLOR_01="#323437"           # Black (Host)
export COLOR_02="#FF5454"           # Red (Syntax string)
export COLOR_03="#8CC85F"           # Green (Command)
export COLOR_04="#E3C78A"           # Yellow (Command second)
export COLOR_05="#80A0FF"           # Blue (Path)
export COLOR_06="#CF87E8"           # Magenta (Syntax var)
export COLOR_07="#79DAC8"           # Cyan (Prompt)
export COLOR_08="#C6C6C6"           # White

export COLOR_09="#949494"           # Bright Black
export COLOR_10="#FF5189"           # Bright Red (Command error)
export COLOR_11="#36C692"           # Bright Green (Exec)
export COLOR_12="#C2C292"           # Bright Yellow
export COLOR_13="#74B2FF"           # Bright Blue (Folder)
export COLOR_14="#AE81FF"           # Bright Magenta
export COLOR_15="#85DC85"           # Bright Cyan
export COLOR_16="#E4E4E4"           # Bright White

export BACKGROUND_COLOR="#080808"   # Background
export FOREGROUND_COLOR="#BDBDBD"   # Foreground (Text)

export CURSOR_COLOR="#9E9E9E" # Cursor

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
