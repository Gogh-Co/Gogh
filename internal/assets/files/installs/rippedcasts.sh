#!/usr/bin/env bash

export PROFILE_NAME="Rippedcasts"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#CDAF95"           # Red (Syntax string)
export COLOR_03="#A8FF60"           # Green (Command)
export COLOR_04="#BFBB1F"           # Yellow (Command second)
export COLOR_05="#75A5B0"           # Blue (Path)
export COLOR_06="#FF73FD"           # Magenta (Syntax var)
export COLOR_07="#5A647E"           # Cyan (Prompt)
export COLOR_08="#BFBFBF"           # White

export COLOR_09="#666666"           # Bright Black
export COLOR_10="#EECBAD"           # Bright Red (Command error)
export COLOR_11="#BCEE68"           # Bright Green (Exec)
export COLOR_12="#E5E500"           # Bright Yellow
export COLOR_13="#86BDC9"           # Bright Blue (Folder)
export COLOR_14="#E500E5"           # Bright Magenta
export COLOR_15="#8C9BC4"           # Bright Cyan
export COLOR_16="#E5E5E5"           # Bright White

export BACKGROUND_COLOR="#2B2B2B"   # Background
export FOREGROUND_COLOR="#FFFFFF"   # Foreground (Text)

export CURSOR_COLOR="#FFFFFF" # Cursor

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
