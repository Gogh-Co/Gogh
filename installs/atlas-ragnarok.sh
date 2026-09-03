#!/usr/bin/env bash

export PROFILE_NAME="Atlas Ragnarok"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#FF8080"           # Red (Syntax string)
export COLOR_03="#99FFE4"           # Green (Command)
export COLOR_04="#2563EB"           # Yellow (Command second)
export COLOR_05="#A0A0A0"           # Blue (Path)
export COLOR_06="#3B82F6"           # Magenta (Syntax var)
export COLOR_07="#99FFE4"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#505050"           # Bright Black
export COLOR_10="#FF9999"           # Bright Red (Command error)
export COLOR_11="#B3FFE4"           # Bright Green (Exec)
export COLOR_12="#60A5FA"           # Bright Yellow
export COLOR_13="#B0B0B0"           # Bright Blue (Folder)
export COLOR_14="#93C5FD"           # Bright Magenta
export COLOR_15="#99FFE4"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#000000"   # Background
export FOREGROUND_COLOR="#FFFFFF"   # Foreground (Text)

export CURSOR_COLOR="#3B82F6" # Cursor

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
