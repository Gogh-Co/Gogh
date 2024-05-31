#!/usr/bin/env bash

export PROFILE_NAME="Argonaut"

export COLOR_01="#232323"           # Black (Host)
export COLOR_02="#FF000F"           # Red (Syntax string)
export COLOR_03="#8CE10B"           # Green (Command)
export COLOR_04="#FFB900"           # Yellow (Command second)
export COLOR_05="#008DF8"           # Blue (Path)
export COLOR_06="#6D43A6"           # Magenta (Syntax var)
export COLOR_07="#00D8EB"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#444444"           # Bright Black
export COLOR_10="#FF2740"           # Bright Red (Command error)
export COLOR_11="#ABE15B"           # Bright Green (Exec)
export COLOR_12="#FFD242"           # Bright Yellow
export COLOR_13="#0092FF"           # Bright Blue (Folder)
export COLOR_14="#9A5FEB"           # Bright Magenta
export COLOR_15="#67FFF0"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#0E1019"   # Background
export FOREGROUND_COLOR="#FFFAF4"   # Foreground (Text)

export CURSOR_COLOR="#FFFAF4" # Cursor

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
