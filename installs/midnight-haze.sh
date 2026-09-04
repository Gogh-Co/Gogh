#!/usr/bin/env bash

export PROFILE_NAME="Midnight Haze"

export COLOR_01="#2C2C3D"           # Black (Host)
export COLOR_02="#FF6E6E"           # Red (Syntax string)
export COLOR_03="#9EC875"           # Green (Command)
export COLOR_04="#FFA759"           # Yellow (Command second)
export COLOR_05="#70A7D4"           # Blue (Path)
export COLOR_06="#D291E0"           # Magenta (Syntax var)
export COLOR_07="#96E0E0"           # Cyan (Prompt)
export COLOR_08="#D8DEE9"           # White

export COLOR_09="#414166"           # Bright Black
export COLOR_10="#FF8D8D"           # Bright Red (Command error)
export COLOR_11="#B3D987"           # Bright Green (Exec)
export COLOR_12="#FFC57F"           # Bright Yellow
export COLOR_13="#9BB3D3"           # Bright Blue (Folder)
export COLOR_14="#FFA1FF"           # Bright Magenta
export COLOR_15="#9CD8D8"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#0C0C16"   # Background
export FOREGROUND_COLOR="#D8DEE9"   # Foreground (Text)

export CURSOR_COLOR="#D8DEE9" # Cursor

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
