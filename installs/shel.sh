#!/usr/bin/env bash

export PROFILE_NAME="Shel"

export COLOR_01="#2C2423"           # Black (Host)
export COLOR_02="#AB2463"           # Red (Syntax string)
export COLOR_03="#6CA323"           # Green (Command)
export COLOR_04="#AB6423"           # Yellow (Command second)
export COLOR_05="#2C64A2"           # Blue (Path)
export COLOR_06="#6C24A2"           # Magenta (Syntax var)
export COLOR_07="#2CA363"           # Cyan (Prompt)
export COLOR_08="#918988"           # White

export COLOR_09="#918988"           # Bright Black
export COLOR_10="#F588B9"           # Bright Red (Command error)
export COLOR_11="#C2EE86"           # Bright Green (Exec)
export COLOR_12="#F5BA86"           # Bright Yellow
export COLOR_13="#8FBAEC"           # Bright Blue (Folder)
export COLOR_14="#C288EC"           # Bright Magenta
export COLOR_15="#8FEEB9"           # Bright Cyan
export COLOR_16="#F5EEEC"           # Bright White

export BACKGROUND_COLOR="#2A201F"   # Background
export FOREGROUND_COLOR="#4882CD"   # Foreground (Text)

export CURSOR_COLOR="#4882CD" # Cursor

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
