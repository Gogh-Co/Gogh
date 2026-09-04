#!/usr/bin/env bash

export PROFILE_NAME="Windows 95 Light"

export COLOR_01="#FCFCFC"           # Black (Host)
export COLOR_02="#A80000"           # Red (Syntax string)
export COLOR_03="#00A800"           # Green (Command)
export COLOR_04="#A85400"           # Yellow (Command second)
export COLOR_05="#0000A8"           # Blue (Path)
export COLOR_06="#A800A8"           # Magenta (Syntax var)
export COLOR_07="#00A8A8"           # Cyan (Prompt)
export COLOR_08="#545454"           # White

export COLOR_09="#A8A8A8"           # Bright Black
export COLOR_10="#A80000"           # Bright Red (Command error)
export COLOR_11="#00A800"           # Bright Green (Exec)
export COLOR_12="#A85400"           # Bright Yellow
export COLOR_13="#0000A8"           # Bright Blue (Folder)
export COLOR_14="#A800A8"           # Bright Magenta
export COLOR_15="#00A8A8"           # Bright Cyan
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
