#!/usr/bin/env bash

export PROFILE_NAME="Monokai Pro"

export COLOR_01="#2D2A2E"           # Black (Host)
export COLOR_02="#FF6188"           # Red (Syntax string)
export COLOR_03="#A9DC76"           # Green (Command)
export COLOR_04="#FFD866"           # Yellow (Command second)
export COLOR_05="#FC9867"           # Blue (Path)
export COLOR_06="#AB9DF2"           # Magenta (Syntax var)
export COLOR_07="#78DCE8"           # Cyan (Prompt)
export COLOR_08="#FCFCFA"           # White

export COLOR_09="#908E8F"           # Bright Black
export COLOR_10="#FF6188"           # Bright Red (Command error)
export COLOR_11="#A9DC76"           # Bright Green (Exec)
export COLOR_12="#FFD866"           # Bright Yellow
export COLOR_13="#FC9867"           # Bright Blue (Folder)
export COLOR_14="#AB9DF2"           # Bright Magenta
export COLOR_15="#78DCE8"           # Bright Cyan
export COLOR_16="#FCFCFA"           # Bright White

export BACKGROUND_COLOR="#2D2A2E"   # Background
export FOREGROUND_COLOR="#FCFCFA"   # Foreground (Text)

export CURSOR_COLOR="#FCFCFA" # Cursor

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
