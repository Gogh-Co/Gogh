#!/usr/bin/env bash

export PROFILE_NAME="Yorumi Abyss"

export COLOR_01="#060914"           # Black (Host)
export COLOR_02="#C65E53"           # Red (Syntax string)
export COLOR_03="#8CB167"           # Green (Command)
export COLOR_04="#C39D55"           # Yellow (Command second)
export COLOR_05="#597BC0"           # Blue (Path)
export COLOR_06="#BB5D7D"           # Magenta (Syntax var)
export COLOR_07="#67BBB9"           # Cyan (Prompt)
export COLOR_08="#BDBFCB"           # White

export COLOR_09="#343742"           # Bright Black
export COLOR_10="#F47571"           # Bright Red (Command error)
export COLOR_11="#A9D07C"           # Bright Green (Exec)
export COLOR_12="#E1C084"           # Bright Yellow
export COLOR_13="#798DDC"           # Bright Blue (Folder)
export COLOR_14="#E184AF"           # Bright Magenta
export COLOR_15="#85E0CB"           # Bright Cyan
export COLOR_16="#D7E1B7"           # Bright White

export BACKGROUND_COLOR="#060914"   # Background
export FOREGROUND_COLOR="#BDBFCB"   # Foreground (Text)

export CURSOR_COLOR="#BDBFCB" # Cursor

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
