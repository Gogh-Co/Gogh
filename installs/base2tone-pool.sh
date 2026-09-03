#!/usr/bin/env bash

export PROFILE_NAME="Base2Tone Pool"

export COLOR_01="#2A2433"           # Black (Host)
export COLOR_02="#AA75F5"           # Red (Syntax string)
export COLOR_03="#F87972"           # Green (Command)
export COLOR_04="#FFB6B3"           # Yellow (Command second)
export COLOR_05="#B886FD"           # Blue (Path)
export COLOR_06="#F87972"           # Magenta (Syntax var)
export COLOR_07="#C7A0FE"           # Cyan (Prompt)
export COLOR_08="#9A90A7"           # White

export COLOR_09="#635775"           # Bright Black
export COLOR_10="#FC8983"           # Bright Red (Command error)
export COLOR_11="#372F42"           # Bright Green (Exec)
export COLOR_12="#574B68"           # Bright Yellow
export COLOR_13="#706383"           # Bright Blue (Folder)
export COLOR_14="#E4D2FE"           # Bright Magenta
export COLOR_15="#F36F68"           # Bright Cyan
export COLOR_16="#F3EBFF"           # Bright White

export BACKGROUND_COLOR="#2A2433"   # Background
export FOREGROUND_COLOR="#9A90A7"   # Foreground (Text)

export CURSOR_COLOR="#CF504A" # Cursor

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
