#!/usr/bin/env bash

export PROFILE_NAME="Outrun Electric"

export COLOR_01="#131033"           # Black (Host)
export COLOR_02="#E61F44"           # Red (Syntax string)
export COLOR_03="#A7DA1E"           # Green (Command)
export COLOR_04="#FFD400"           # Yellow (Command second)
export COLOR_05="#1EA8FC"           # Blue (Path)
export COLOR_06="#FF2AFC"           # Magenta (Syntax var)
export COLOR_07="#42C6FF"           # Cyan (Prompt)
export COLOR_08="#F2F3F7"           # White

export COLOR_09="#546A90"           # Bright Black
export COLOR_10="#EF6D85"           # Bright Red (Command error)
export COLOR_11="#C6E76D"           # Bright Green (Exec)
export COLOR_12="#FFE359"           # Bright Yellow
export COLOR_13="#6DC6FD"           # Bright Blue (Folder)
export COLOR_14="#DF85FF"           # Bright Magenta
export COLOR_15="#84DAFF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#0C0A20"   # Background
export FOREGROUND_COLOR="#F2F3F7"   # Foreground (Text)

export CURSOR_COLOR="#FF2AFC" # Cursor

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
