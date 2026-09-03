#!/usr/bin/env bash

export PROFILE_NAME="Adwaita Dark"

export COLOR_01="#241F31"           # Black (Host)
export COLOR_02="#C01C28"           # Red (Syntax string)
export COLOR_03="#2EC27E"           # Green (Command)
export COLOR_04="#F5C211"           # Yellow (Command second)
export COLOR_05="#1E78E4"           # Blue (Path)
export COLOR_06="#9841BB"           # Magenta (Syntax var)
export COLOR_07="#0AB9DC"           # Cyan (Prompt)
export COLOR_08="#C0BFBC"           # White

export COLOR_09="#5E5C64"           # Bright Black
export COLOR_10="#ED333B"           # Bright Red (Command error)
export COLOR_11="#57E389"           # Bright Green (Exec)
export COLOR_12="#F8E45C"           # Bright Yellow
export COLOR_13="#51A1FF"           # Bright Blue (Folder)
export COLOR_14="#C061CB"           # Bright Magenta
export COLOR_15="#4FD2FD"           # Bright Cyan
export COLOR_16="#F6F5F4"           # Bright White

export BACKGROUND_COLOR="#1C1C1F"   # Background
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
