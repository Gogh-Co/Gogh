#!/usr/bin/env bash

export PROFILE_NAME="Noctis Bordo"

export COLOR_01="#47393E"           # Black (Host)
export COLOR_02="#E66533"           # Red (Syntax string)
export COLOR_03="#49E9A6"           # Green (Command)
export COLOR_04="#E4B781"           # Yellow (Command second)
export COLOR_05="#49ACE9"           # Blue (Path)
export COLOR_06="#DF769B"           # Magenta (Syntax var)
export COLOR_07="#49D6E9"           # Cyan (Prompt)
export COLOR_08="#B9ACB0"           # White

export COLOR_09="#69545B"           # Bright Black
export COLOR_10="#E97749"           # Bright Red (Command error)
export COLOR_11="#60EBB1"           # Bright Green (Exec)
export COLOR_12="#E69533"           # Bright Yellow
export COLOR_13="#60B6EB"           # Bright Blue (Folder)
export COLOR_14="#E798B3"           # Bright Magenta
export COLOR_15="#60DBEB"           # Bright Cyan
export COLOR_16="#CBBEC2"           # Bright White

export BACKGROUND_COLOR="#322A2D"   # Background
export FOREGROUND_COLOR="#CBBEC2"   # Foreground (Text)

export CURSOR_COLOR="#CBBEC2" # Cursor

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
