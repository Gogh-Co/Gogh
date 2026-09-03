#!/usr/bin/env bash

export PROFILE_NAME="Karma Light Dimmed"

export COLOR_01="#1C1F24"           # Black (Host)
export COLOR_02="#E07A90"           # Red (Syntax string)
export COLOR_03="#4A9A4C"           # Green (Command)
export COLOR_04="#D49A26"           # Yellow (Command second)
export COLOR_05="#6688B8"           # Blue (Path)
export COLOR_06="#7C5AB0"           # Magenta (Syntax var)
export COLOR_07="#6688B8"           # Cyan (Prompt)
export COLOR_08="#5A5860"           # White

export COLOR_09="#999999"           # Bright Black
export COLOR_10="#E07A90"           # Bright Red (Command error)
export COLOR_11="#4A9A4C"           # Bright Green (Exec)
export COLOR_12="#E0A040"           # Bright Yellow
export COLOR_13="#6688B8"           # Bright Blue (Folder)
export COLOR_14="#9676D0"           # Bright Magenta
export COLOR_15="#6688B8"           # Bright Cyan
export COLOR_16="#1C1F24"           # Bright White

export BACKGROUND_COLOR="#F5F3F7"   # Background
export FOREGROUND_COLOR="#1C1F24"   # Foreground (Text)

export CURSOR_COLOR="#9676D0" # Cursor

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
