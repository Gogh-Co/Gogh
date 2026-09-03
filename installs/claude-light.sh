#!/usr/bin/env bash

export PROFILE_NAME="Claude Light"

export COLOR_01="#0A0A0A"           # Black (Host)
export COLOR_02="#A84B3A"           # Red (Syntax string)
export COLOR_03="#2E7C4C"           # Green (Command)
export COLOR_04="#8A6220"           # Yellow (Command second)
export COLOR_05="#184E95"           # Blue (Path)
export COLOR_06="#882B4D"           # Magenta (Syntax var)
export COLOR_07="#066049"           # Cyan (Prompt)
export COLOR_08="#B6B5AA"           # White

export COLOR_09="#51504D"           # Bright Black
export COLOR_10="#E34A4A"           # Bright Red (Command error)
export COLOR_11="#639900"           # Bright Green (Exec)
export COLOR_12="#B87700"           # Bright Yellow
export COLOR_13="#3886E5"           # Bright Blue (Folder)
export COLOR_14="#D55382"           # Bright Magenta
export COLOR_15="#199F70"           # Bright Cyan
export COLOR_16="#E2E1DA"           # Bright White

export BACKGROUND_COLOR="#FAF9F5"   # Background
export FOREGROUND_COLOR="#141413"   # Foreground (Text)

export CURSOR_COLOR="#D97757" # Cursor

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
