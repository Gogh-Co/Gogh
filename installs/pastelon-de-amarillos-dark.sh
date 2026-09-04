#!/usr/bin/env bash

export PROFILE_NAME="Pastelon De Amarillos Dark"

export COLOR_01="#180D18"           # Black (Host)
export COLOR_02="#D95361"           # Red (Syntax string)
export COLOR_03="#36AA72"           # Green (Command)
export COLOR_04="#D8A93A"           # Yellow (Command second)
export COLOR_05="#4C84BD"           # Blue (Path)
export COLOR_06="#B765B0"           # Magenta (Syntax var)
export COLOR_07="#31A99E"           # Cyan (Prompt)
export COLOR_08="#FFE0A3"           # White

export COLOR_09="#A0747C"           # Bright Black
export COLOR_10="#FFD052"           # Bright Red (Command error)
export COLOR_11="#3ED2C3"           # Bright Green (Exec)
export COLOR_12="#43D98D"           # Bright Yellow
export COLOR_13="#E581DC"           # Bright Blue (Folder)
export COLOR_14="#ED7D51"           # Bright Magenta
export COLOR_15="#64ABF4"           # Bright Cyan
export COLOR_16="#FFF7E6"           # Bright White

export BACKGROUND_COLOR="#180D18"   # Background
export FOREGROUND_COLOR="#FFE0A3"   # Foreground (Text)

export CURSOR_COLOR="#FFE0A3" # Cursor

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
