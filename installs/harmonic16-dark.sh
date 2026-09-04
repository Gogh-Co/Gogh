#!/usr/bin/env bash

export PROFILE_NAME="harmonic16 Dark"

export COLOR_01="#0B1C2C"           # Black (Host)
export COLOR_02="#BF8B56"           # Red (Syntax string)
export COLOR_03="#56BF8B"           # Green (Command)
export COLOR_04="#8BBF56"           # Yellow (Command second)
export COLOR_05="#8B56BF"           # Blue (Path)
export COLOR_06="#BF568B"           # Magenta (Syntax var)
export COLOR_07="#568BBF"           # Cyan (Prompt)
export COLOR_08="#CBD6E2"           # White

export COLOR_09="#627E99"           # Bright Black
export COLOR_10="#BF8B56"           # Bright Red (Command error)
export COLOR_11="#56BF8B"           # Bright Green (Exec)
export COLOR_12="#8BBF56"           # Bright Yellow
export COLOR_13="#8B56BF"           # Bright Blue (Folder)
export COLOR_14="#BF568B"           # Bright Magenta
export COLOR_15="#568BBF"           # Bright Cyan
export COLOR_16="#F7F9FB"           # Bright White

export BACKGROUND_COLOR="#0B1C2C"   # Background
export FOREGROUND_COLOR="#CBD6E2"   # Foreground (Text)

export CURSOR_COLOR="#CBD6E2" # Cursor

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
