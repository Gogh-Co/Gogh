#!/usr/bin/env bash

export PROFILE_NAME="Breath Darker"

export COLOR_01="#1E2229"           # Black (Host)
export COLOR_02="#ED1515"           # Red (Syntax string)
export COLOR_03="#44853A"           # Green (Command)
export COLOR_04="#F67400"           # Yellow (Command second)
export COLOR_05="#1D99F3"           # Blue (Path)
export COLOR_06="#9B59B6"           # Magenta (Syntax var)
export COLOR_07="#1ABC9C"           # Cyan (Prompt)
export COLOR_08="#FCFCFC"           # White

export COLOR_09="#7F8C8D"           # Bright Black
export COLOR_10="#C0392B"           # Bright Red (Command error)
export COLOR_11="#55A649"           # Bright Green (Exec)
export COLOR_12="#FDBC4B"           # Bright Yellow
export COLOR_13="#3DAEE9"           # Bright Blue (Folder)
export COLOR_14="#8E44AD"           # Bright Magenta
export COLOR_15="#16A085"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#080D14"   # Background
export FOREGROUND_COLOR="#17A88B"   # Foreground (Text)

export CURSOR_COLOR="#17A88B" # Cursor

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
