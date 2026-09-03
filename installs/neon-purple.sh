#!/usr/bin/env bash

export PROFILE_NAME="Neon Purple"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#CD0D76"           # Red (Syntax string)
export COLOR_03="#03EBA5"           # Green (Command)
export COLOR_04="#FFFA6A"           # Yellow (Command second)
export COLOR_05="#00BFFF"           # Blue (Path)
export COLOR_06="#FF00E0"           # Magenta (Syntax var)
export COLOR_07="#9AA5ED"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#A8FCFF"           # Bright Black
export COLOR_10="#FF0DA5"           # Bright Red (Command error)
export COLOR_11="#00FFB6"           # Bright Green (Exec)
export COLOR_12="#FFF787"           # Bright Yellow
export COLOR_13="#1BCCFD"           # Bright Blue (Folder)
export COLOR_14="#FF00F8"           # Bright Magenta
export COLOR_15="#A6B6FF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#291B47"   # Background
export FOREGROUND_COLOR="#E5E5E5"   # Foreground (Text)

export CURSOR_COLOR="#21F6BC" # Cursor

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
