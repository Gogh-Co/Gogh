#!/usr/bin/env bash

export PROFILE_NAME="Shades Of Purple"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#D90429"           # Red (Syntax string)
export COLOR_03="#3AD900"           # Green (Command)
export COLOR_04="#FFE700"           # Yellow (Command second)
export COLOR_05="#6943FF"           # Blue (Path)
export COLOR_06="#FF2C70"           # Magenta (Syntax var)
export COLOR_07="#00C5C7"           # Cyan (Prompt)
export COLOR_08="#C7C7C7"           # White

export COLOR_09="#686868"           # Bright Black
export COLOR_10="#F92A1C"           # Bright Red (Command error)
export COLOR_11="#43D426"           # Bright Green (Exec)
export COLOR_12="#F1D000"           # Bright Yellow
export COLOR_13="#6871FF"           # Bright Blue (Folder)
export COLOR_14="#FF77FF"           # Bright Magenta
export COLOR_15="#79E8FB"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#1E1D40"   # Background
export FOREGROUND_COLOR="#FFFFFF"   # Foreground (Text)

export CURSOR_COLOR="#FAD000" # Cursor

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
