#!/usr/bin/env bash

export PROFILE_NAME="SeedFlip Pulse"

export COLOR_01="#0D0D0D"           # Black (Host)
export COLOR_02="#E34F4F"           # Red (Syntax string)
export COLOR_03="#4FE380"           # Green (Command)
export COLOR_04="#E3CB4F"           # Yellow (Command second)
export COLOR_05="#4F8DE3"           # Blue (Path)
export COLOR_06="#E34FE3"           # Magenta (Syntax var)
export COLOR_07="#4FE3E3"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#454545"           # Bright Black
export COLOR_10="#EE9191"           # Bright Red (Command error)
export COLOR_11="#91EEB0"           # Bright Green (Exec)
export COLOR_12="#EEDE91"           # Bright Yellow
export COLOR_13="#91B8EE"           # Bright Blue (Folder)
export COLOR_14="#EE91EE"           # Bright Magenta
export COLOR_15="#91EEEE"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#121212"   # Background
export FOREGROUND_COLOR="#FFFFFF"   # Foreground (Text)

export CURSOR_COLOR="#1DB954" # Cursor

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
