#!/usr/bin/env bash

export PROFILE_NAME="Mono Red"

export COLOR_01="#401200"           # Black (Host)
export COLOR_02="#FF3600"           # Red (Syntax string)
export COLOR_03="#FF3600"           # Green (Command)
export COLOR_04="#FF3600"           # Yellow (Command second)
export COLOR_05="#FF3600"           # Blue (Path)
export COLOR_06="#FF3600"           # Magenta (Syntax var)
export COLOR_07="#FF3600"           # Cyan (Prompt)
export COLOR_08="#FF3600"           # White

export COLOR_09="#FF3600"           # Bright Black
export COLOR_10="#FF3600"           # Bright Red (Command error)
export COLOR_11="#FF3600"           # Bright Green (Exec)
export COLOR_12="#FF3600"           # Bright Yellow
export COLOR_13="#FF3600"           # Bright Blue (Folder)
export COLOR_14="#FF3600"           # Bright Magenta
export COLOR_15="#FF3600"           # Bright Cyan
export COLOR_16="#FF3600"           # Bright White

export BACKGROUND_COLOR="#2B0C00"   # Background
export FOREGROUND_COLOR="#FF3600"   # Foreground (Text)

export CURSOR_COLOR="#FF3600" # Cursor

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
