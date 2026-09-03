#!/usr/bin/env bash

export PROFILE_NAME="SeedFlip Voltage"

export COLOR_01="#050505"           # Black (Host)
export COLOR_02="#F04242"           # Red (Syntax string)
export COLOR_03="#42F07C"           # Green (Command)
export COLOR_04="#F0D342"           # Yellow (Command second)
export COLOR_05="#428BF0"           # Blue (Path)
export COLOR_06="#F042F0"           # Magenta (Syntax var)
export COLOR_07="#42F0F0"           # Cyan (Prompt)
export COLOR_08="#FDFDFD"           # White

export COLOR_09="#3D3D3D"           # Bright Black
export COLOR_10="#F58989"           # Bright Red (Command error)
export COLOR_11="#89F5AD"           # Bright Green (Exec)
export COLOR_12="#F5E389"           # Bright Yellow
export COLOR_13="#89B6F5"           # Bright Blue (Folder)
export COLOR_14="#F589F5"           # Bright Magenta
export COLOR_15="#89F5F5"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#0A0A0A"   # Background
export FOREGROUND_COLOR="#F0F0F0"   # Foreground (Text)

export CURSOR_COLOR="#A6FF00" # Cursor

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
