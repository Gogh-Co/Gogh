#!/usr/bin/env bash

export PROFILE_NAME="Brewer"

export COLOR_01="#0C0D0E"           # Black (Host)
export COLOR_02="#E31A1C"           # Red (Syntax string)
export COLOR_03="#31A354"           # Green (Command)
export COLOR_04="#DCA060"           # Yellow (Command second)
export COLOR_05="#3182BD"           # Blue (Path)
export COLOR_06="#756BB1"           # Magenta (Syntax var)
export COLOR_07="#80B1D3"           # Cyan (Prompt)
export COLOR_08="#B7B8B9"           # White

export COLOR_09="#737475"           # Bright Black
export COLOR_10="#E31A1C"           # Bright Red (Command error)
export COLOR_11="#31A354"           # Bright Green (Exec)
export COLOR_12="#DCA060"           # Bright Yellow
export COLOR_13="#3182BD"           # Bright Blue (Folder)
export COLOR_14="#756BB1"           # Bright Magenta
export COLOR_15="#80B1D3"           # Bright Cyan
export COLOR_16="#FCFDFE"           # Bright White

export BACKGROUND_COLOR="#0C0D0E"   # Background
export FOREGROUND_COLOR="#B7B8B9"   # Foreground (Text)

export CURSOR_COLOR="#B7B8B9" # Cursor

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
