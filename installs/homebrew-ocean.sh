#!/usr/bin/env bash

export PROFILE_NAME="Homebrew Ocean"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#990000"           # Red (Syntax string)
export COLOR_03="#00A600"           # Green (Command)
export COLOR_04="#999900"           # Yellow (Command second)
export COLOR_05="#0000B2"           # Blue (Path)
export COLOR_06="#B200B2"           # Magenta (Syntax var)
export COLOR_07="#00A6B2"           # Cyan (Prompt)
export COLOR_08="#BFBFBF"           # White

export COLOR_09="#666666"           # Bright Black
export COLOR_10="#E50000"           # Bright Red (Command error)
export COLOR_11="#00D900"           # Bright Green (Exec)
export COLOR_12="#E5E500"           # Bright Yellow
export COLOR_13="#0000FF"           # Bright Blue (Folder)
export COLOR_14="#E500E5"           # Bright Magenta
export COLOR_15="#00E5E5"           # Bright Cyan
export COLOR_16="#E5E5E5"           # Bright White

export BACKGROUND_COLOR="#224FBC"   # Background
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
