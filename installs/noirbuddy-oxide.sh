#!/usr/bin/env bash

export PROFILE_NAME="Noirbuddy Oxide"

export COLOR_01="#070E11"           # Black (Host)
export COLOR_02="#FA5E86"           # Red (Syntax string)
export COLOR_03="#00D992"           # Green (Command)
export COLOR_04="#FFFFFF"           # Yellow (Command second)
export COLOR_05="#B0B0B0"           # Blue (Path)
export COLOR_06="#90A7F8"           # Magenta (Syntax var)
export COLOR_07="#787878"           # Cyan (Prompt)
export COLOR_08="#D5D5D5"           # White

export COLOR_09="#737373"           # Bright Black
export COLOR_10="#FF0088"           # Bright Red (Command error)
export COLOR_11="#00FF77"           # Bright Green (Exec)
export COLOR_12="#FDFDFD"           # Bright Yellow
export COLOR_13="#BEBEBE"           # Bright Blue (Folder)
export COLOR_14="#939393"           # Bright Magenta
export COLOR_15="#919191"           # Bright Cyan
export COLOR_16="#F5F5F5"           # Bright White

export BACKGROUND_COLOR="#070E11"   # Background
export FOREGROUND_COLOR="#D5D5D5"   # Foreground (Text)

export CURSOR_COLOR="#D5D5D5" # Cursor

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
