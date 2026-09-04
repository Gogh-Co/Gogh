#!/usr/bin/env bash

export PROFILE_NAME="Windows 95"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#FC5454"           # Red (Syntax string)
export COLOR_03="#54FC54"           # Green (Command)
export COLOR_04="#FCFC54"           # Yellow (Command second)
export COLOR_05="#5454FC"           # Blue (Path)
export COLOR_06="#FC54FC"           # Magenta (Syntax var)
export COLOR_07="#54FCFC"           # Cyan (Prompt)
export COLOR_08="#A8A8A8"           # White

export COLOR_09="#545454"           # Bright Black
export COLOR_10="#FC5454"           # Bright Red (Command error)
export COLOR_11="#54FC54"           # Bright Green (Exec)
export COLOR_12="#FCFC54"           # Bright Yellow
export COLOR_13="#5454FC"           # Bright Blue (Folder)
export COLOR_14="#FC54FC"           # Bright Magenta
export COLOR_15="#54FCFC"           # Bright Cyan
export COLOR_16="#FCFCFC"           # Bright White

export BACKGROUND_COLOR="#000000"   # Background
export FOREGROUND_COLOR="#A8A8A8"   # Foreground (Text)

export CURSOR_COLOR="#A8A8A8" # Cursor

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
