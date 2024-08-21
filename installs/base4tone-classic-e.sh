#!/usr/bin/env bash

export PROFILE_NAME="Base4Tone Classic E"

export COLOR_01="#21211c"           # Black (Host)
export COLOR_02="#088ea0"           # Red (Syntax string)
export COLOR_03="#c27905"           # Green (Command)
export COLOR_04="#e8a02c"           # Yellow (Command second)
export COLOR_05="#b9cf17"           # Blue (Path)
export COLOR_06="#5cba21"           # Magenta (Syntax var)
export COLOR_07="#dc9118"           # Cyan (Prompt)
export COLOR_08="#edeee8"           # White

export COLOR_09="#0d0d07"           # Bright Black
export COLOR_10="#25bcd0"           # Bright Red (Command error)
export COLOR_11="#eaa83e"           # Bright Green (Exec)
export COLOR_12="#f3cd91"           # Bright Yellow
export COLOR_13="#eef6b1"           # Bright Blue (Folder)
export COLOR_14="#69d425"           # Bright Magenta
export COLOR_15="#e6f28c"           # Bright Cyan
export COLOR_16="#f9f9f6"           # Bright White

export BACKGROUND_COLOR="#21211c"   # Background
export FOREGROUND_COLOR="#a0a290"   # Foreground (Text)

export CURSOR_COLOR="#877d6e" # Cursor

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
