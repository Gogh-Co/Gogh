#!/usr/bin/env bash

export PROFILE_NAME="Base2Tone Pool"

export COLOR_01="#2a2433"           # Black (Host)
export COLOR_02="#aa75f5"           # Red (Syntax string)
export COLOR_03="#f87972"           # Green (Command)
export COLOR_04="#ffb6b3"           # Yellow (Command second)
export COLOR_05="#b886fd"           # Blue (Path)
export COLOR_06="#f87972"           # Magenta (Syntax var)
export COLOR_07="#c7a0fe"           # Cyan (Prompt)
export COLOR_08="#9a90a7"           # White

export COLOR_09="#635775"           # Bright Black
export COLOR_10="#fc8983"           # Bright Red (Command error)
export COLOR_11="#372f42"           # Bright Green (Exec)
export COLOR_12="#574b68"           # Bright Yellow
export COLOR_13="#706383"           # Bright Blue (Folder)
export COLOR_14="#e4d2fe"           # Bright Magenta
export COLOR_15="#f36f68"           # Bright Cyan
export COLOR_16="#f3ebff"           # Bright White

export BACKGROUND_COLOR="#2a2433"   # Background
export FOREGROUND_COLOR="#9a90a7"   # Foreground (Text)

export CURSOR_COLOR="#cf504a" # Cursor

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
