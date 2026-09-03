#!/usr/bin/env bash

export PROFILE_NAME="Karasu Snow"

export COLOR_01="#0A0A0A"           # Black (Host)
export COLOR_02="#B84755"           # Red (Syntax string)
export COLOR_03="#3F7E4A"           # Green (Command)
export COLOR_04="#8A6A1F"           # Yellow (Command second)
export COLOR_05="#2E5E9B"           # Blue (Path)
export COLOR_06="#6C4BB8"           # Magenta (Syntax var)
export COLOR_07="#2D7E7A"           # Cyan (Prompt)
export COLOR_08="#F5F5F5"           # White

export COLOR_09="#404040"           # Bright Black
export COLOR_10="#D93C3C"           # Bright Red (Command error)
export COLOR_11="#2F9150"           # Bright Green (Exec)
export COLOR_12="#9A7A1D"           # Bright Yellow
export COLOR_13="#2B72C7"           # Bright Blue (Folder)
export COLOR_14="#7B59D6"           # Bright Magenta
export COLOR_15="#1F968F"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#FAFAFA"   # Background
export FOREGROUND_COLOR="#292524"   # Foreground (Text)

export CURSOR_COLOR="#0A0A0A" # Cursor

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
