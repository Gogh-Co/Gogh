#!/usr/bin/env bash

export PROFILE_NAME="Mesila One"

export COLOR_01="#111418"           # Black (Host)
export COLOR_02="#918680"           # Red (Syntax string)
export COLOR_03="#79C6FA"           # Green (Command)
export COLOR_04="#E2B5AB"           # Yellow (Command second)
export COLOR_05="#D9C2FB"           # Blue (Path)
export COLOR_06="#7B70B5"           # Magenta (Syntax var)
export COLOR_07="#79C6FA"           # Cyan (Prompt)
export COLOR_08="#ECF9E5"           # White

export COLOR_09="#7B70B5"           # Bright Black
export COLOR_10="#918680"           # Bright Red (Command error)
export COLOR_11="#79C6FA"           # Bright Green (Exec)
export COLOR_12="#E2B5AB"           # Bright Yellow
export COLOR_13="#D9C2FB"           # Bright Blue (Folder)
export COLOR_14="#7B70B5"           # Bright Magenta
export COLOR_15="#79C6FA"           # Bright Cyan
export COLOR_16="#ECF9E5"           # Bright White

export BACKGROUND_COLOR="#1C1F23"   # Background
export FOREGROUND_COLOR="#ECF9E5"   # Foreground (Text)

export CURSOR_COLOR="#79C6FA" # Cursor

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
