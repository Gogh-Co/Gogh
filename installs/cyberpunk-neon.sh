#!/usr/bin/env bash

export PROFILE_NAME="Cyberpunk Neon"

export COLOR_01="#000B1E"           # Black (Host)
export COLOR_02="#FF0000"           # Red (Syntax string)
export COLOR_03="#D300C4"           # Green (Command)
export COLOR_04="#F57800"           # Yellow (Command second)
export COLOR_05="#133E7C"           # Blue (Path)
export COLOR_06="#711C91"           # Magenta (Syntax var)
export COLOR_07="#0ABDC6"           # Cyan (Prompt)
export COLOR_08="#0ABDC6"           # White

export COLOR_09="#1C61C2"           # Bright Black
export COLOR_10="#FF0000"           # Bright Red (Command error)
export COLOR_11="#D300C4"           # Bright Green (Exec)
export COLOR_12="#FF5780"           # Bright Yellow
export COLOR_13="#00FF00"           # Bright Blue (Folder)
export COLOR_14="#711C91"           # Bright Magenta
export COLOR_15="#0ABDC6"           # Bright Cyan
export COLOR_16="#0ABDC6"           # Bright White

export BACKGROUND_COLOR="#000B1E"   # Background
export FOREGROUND_COLOR="#0ABDC6"   # Foreground (Text)

export CURSOR_COLOR="#0ABDC6" # Cursor

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
