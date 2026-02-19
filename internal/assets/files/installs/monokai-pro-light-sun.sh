#!/usr/bin/env bash

export PROFILE_NAME="Monokai Pro Light Sun"

export COLOR_01="#FDF7F3"           # Black (Host)
export COLOR_02="#CE4770"           # Red (Syntax string)
export COLOR_03="#218871"           # Green (Command)
export COLOR_04="#B16803"           # Yellow (Command second)
export COLOR_05="#D4572B"           # Blue (Path)
export COLOR_06="#6851A2"           # Magenta (Syntax var)
export COLOR_07="#2473B6"           # Cyan (Prompt)
export COLOR_08="#2C232E"           # White

export COLOR_09="#595451"           # Bright Black
export COLOR_10="#CE4770"           # Bright Red (Command error)
export COLOR_11="#218871"           # Bright Green (Exec)
export COLOR_12="#B16803"           # Bright Yellow
export COLOR_13="#D4572B"           # Bright Blue (Folder)
export COLOR_14="#6851A2"           # Bright Magenta
export COLOR_15="#2473B6"           # Bright Cyan
export COLOR_16="#2C232E"           # Bright White

export BACKGROUND_COLOR="#FDF7F3"   # Background
export FOREGROUND_COLOR="#2C232E"   # Foreground (Text)

export CURSOR_COLOR="#2C232E" # Cursor

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
