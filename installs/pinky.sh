#!/usr/bin/env bash

export PROFILE_NAME="Pinky"

export COLOR_01="#171517"           # Black (Host)
export COLOR_02="#FFA600"           # Red (Syntax string)
export COLOR_03="#FF0066"           # Green (Command)
export COLOR_04="#20DF6C"           # Yellow (Command second)
export COLOR_05="#00FFFF"           # Blue (Path)
export COLOR_06="#007FFF"           # Magenta (Syntax var)
export COLOR_07="#6600FF"           # Cyan (Prompt)
export COLOR_08="#F5F5F5"           # White

export COLOR_09="#383338"           # Bright Black
export COLOR_10="#FFA600"           # Bright Red (Command error)
export COLOR_11="#FF0066"           # Bright Green (Exec)
export COLOR_12="#20DF6C"           # Bright Yellow
export COLOR_13="#00FFFF"           # Bright Blue (Folder)
export COLOR_14="#007FFF"           # Bright Magenta
export COLOR_15="#6600FF"           # Bright Cyan
export COLOR_16="#F7F3F7"           # Bright White

export BACKGROUND_COLOR="#171517"   # Background
export FOREGROUND_COLOR="#F5F5F5"   # Foreground (Text)

export CURSOR_COLOR="#F5F5F5" # Cursor

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
