#!/usr/bin/env bash

export PROFILE_NAME="Snazzy"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#FC4346"           # Red (Syntax string)
export COLOR_03="#50FB7C"           # Green (Command)
export COLOR_04="#F0FB8C"           # Yellow (Command second)
export COLOR_05="#49BAFF"           # Blue (Path)
export COLOR_06="#FC4CB4"           # Magenta (Syntax var)
export COLOR_07="#8BE9FE"           # Cyan (Prompt)
export COLOR_08="#EDEDEC"           # White

export COLOR_09="#555555"           # Bright Black
export COLOR_10="#FC4346"           # Bright Red (Command error)
export COLOR_11="#50FB7C"           # Bright Green (Exec)
export COLOR_12="#F0FB8C"           # Bright Yellow
export COLOR_13="#49BAFF"           # Bright Blue (Folder)
export COLOR_14="#FC4CB4"           # Bright Magenta
export COLOR_15="#8BE9FE"           # Bright Cyan
export COLOR_16="#EDEDEC"           # Bright White

export BACKGROUND_COLOR="#1E1F29"   # Background
export FOREGROUND_COLOR="#EBECE6"   # Foreground (Text)

export CURSOR_COLOR="#E4E4E4" # Cursor

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
