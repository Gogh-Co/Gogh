#!/usr/bin/env bash

export PROFILE_NAME="Miami Heat"

export COLOR_01="#2A1A4A"           # Black (Host)
export COLOR_02="#FF3D7F"           # Red (Syntax string)
export COLOR_03="#2EE6B6"           # Green (Command)
export COLOR_04="#FFCB52"           # Yellow (Command second)
export COLOR_05="#29B6FF"           # Blue (Path)
export COLOR_06="#B86BFF"           # Magenta (Syntax var)
export COLOR_07="#18E0FF"           # Cyan (Prompt)
export COLOR_08="#E6D4FF"           # White

export COLOR_09="#5E5388"           # Bright Black
export COLOR_10="#FF2E97"           # Bright Red (Command error)
export COLOR_11="#2EE6B6"           # Bright Green (Exec)
export COLOR_12="#FF7847"           # Bright Yellow
export COLOR_13="#29B6FF"           # Bright Blue (Folder)
export COLOR_14="#B86BFF"           # Bright Magenta
export COLOR_15="#18E0FF"           # Bright Cyan
export COLOR_16="#FCE7FF"           # Bright White

export BACKGROUND_COLOR="#120B2E"   # Background
export FOREGROUND_COLOR="#FCE7FF"   # Foreground (Text)

export CURSOR_COLOR="#FF2E97" # Cursor

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
