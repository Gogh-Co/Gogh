#!/usr/bin/env bash

export PROFILE_NAME="Neon Night"

export COLOR_01="#20242D"           # Black (Host)
export COLOR_02="#FF8E8E"           # Red (Syntax string)
export COLOR_03="#7EFDD0"           # Green (Command)
export COLOR_04="#FCAD3F"           # Yellow (Command second)
export COLOR_05="#69B4F9"           # Blue (Path)
export COLOR_06="#DD92F6"           # Magenta (Syntax var)
export COLOR_07="#8CE8FF"           # Cyan (Prompt)
export COLOR_08="#C9CCCD"           # White

export COLOR_09="#20242D"           # Bright Black
export COLOR_10="#FF8E8E"           # Bright Red (Command error)
export COLOR_11="#7EFDD0"           # Bright Green (Exec)
export COLOR_12="#FCAD3F"           # Bright Yellow
export COLOR_13="#69B4F9"           # Bright Blue (Folder)
export COLOR_14="#DD92F6"           # Bright Magenta
export COLOR_15="#8CE8FF"           # Bright Cyan
export COLOR_16="#C9CCCD"           # Bright White

export BACKGROUND_COLOR="#20242D"   # Background
export FOREGROUND_COLOR="#C7C8FF"   # Foreground (Text)

export CURSOR_COLOR="#C7C8FF" # Cursor

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
