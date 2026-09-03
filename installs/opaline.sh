#!/usr/bin/env bash

export PROFILE_NAME="Opaline"

export COLOR_01="#201B33"           # Black (Host)
export COLOR_02="#FF6B92"           # Red (Syntax string)
export COLOR_03="#86E6B4"           # Green (Command)
export COLOR_04="#FFC2AE"           # Yellow (Command second)
export COLOR_05="#8FB4FF"           # Blue (Path)
export COLOR_06="#BE9BFF"           # Magenta (Syntax var)
export COLOR_07="#5FE3D8"           # Cyan (Prompt)
export COLOR_08="#ECE9F7"           # White

export COLOR_09="#6B678F"           # Bright Black
export COLOR_10="#FF81A2"           # Bright Red (Command error)
export COLOR_11="#95E9BD"           # Bright Green (Exec)
export COLOR_12="#F4D27E"           # Bright Yellow
export COLOR_13="#B79BFF"           # Bright Blue (Folder)
export COLOR_14="#FF9ED2"           # Bright Magenta
export COLOR_15="#72E6DD"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#131121"   # Background
export FOREGROUND_COLOR="#ECE9F7"   # Foreground (Text)

export CURSOR_COLOR="#FFB3D6" # Cursor

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
