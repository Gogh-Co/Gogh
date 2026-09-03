#!/usr/bin/env bash

export PROFILE_NAME="Sumi Linen"

export COLOR_01="#3A342C"           # Black (Host)
export COLOR_02="#B83830"           # Red (Syntax string)
export COLOR_03="#2E8050"           # Green (Command)
export COLOR_04="#A87820"           # Yellow (Command second)
export COLOR_05="#3060A0"           # Blue (Path)
export COLOR_06="#704890"           # Magenta (Syntax var)
export COLOR_07="#18786C"           # Cyan (Prompt)
export COLOR_08="#5A5448"           # White

export COLOR_09="#6A6458"           # Bright Black
export COLOR_10="#C84840"           # Bright Red (Command error)
export COLOR_11="#3A9868"           # Bright Green (Exec)
export COLOR_12="#C09030"           # Bright Yellow
export COLOR_13="#4080C0"           # Bright Blue (Folder)
export COLOR_14="#8858A8"           # Bright Magenta
export COLOR_15="#28A090"           # Bright Cyan
export COLOR_16="#14100C"           # Bright White

export BACKGROUND_COLOR="#E6DFD0"   # Background
export FOREGROUND_COLOR="#1C1814"   # Foreground (Text)

export CURSOR_COLOR="#18786C" # Cursor

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
