#!/usr/bin/env bash

export PROFILE_NAME="Windows Highcontrast Light"

export COLOR_01="#FCFCFC"           # Black (Host)
export COLOR_02="#800000"           # Red (Syntax string)
export COLOR_03="#008000"           # Green (Command)
export COLOR_04="#808000"           # Yellow (Command second)
export COLOR_05="#000080"           # Blue (Path)
export COLOR_06="#800080"           # Magenta (Syntax var)
export COLOR_07="#008080"           # Cyan (Prompt)
export COLOR_08="#545454"           # White

export COLOR_09="#C0C0C0"           # Bright Black
export COLOR_10="#800000"           # Bright Red (Command error)
export COLOR_11="#008000"           # Bright Green (Exec)
export COLOR_12="#808000"           # Bright Yellow
export COLOR_13="#000080"           # Bright Blue (Folder)
export COLOR_14="#800080"           # Bright Magenta
export COLOR_15="#008080"           # Bright Cyan
export COLOR_16="#000000"           # Bright White

export BACKGROUND_COLOR="#FCFCFC"   # Background
export FOREGROUND_COLOR="#545454"   # Foreground (Text)

export CURSOR_COLOR="#545454" # Cursor

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
