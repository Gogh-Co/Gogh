#!/usr/bin/env bash

export PROFILE_NAME="Paraiso Dark"

export COLOR_01="#2F1E2E"           # Black (Host)
export COLOR_02="#EF6155"           # Red (Syntax string)
export COLOR_03="#48B685"           # Green (Command)
export COLOR_04="#FEC418"           # Yellow (Command second)
export COLOR_05="#06B6EF"           # Blue (Path)
export COLOR_06="#815BA4"           # Magenta (Syntax var)
export COLOR_07="#5BC4BF"           # Cyan (Prompt)
export COLOR_08="#A39E9B"           # White

export COLOR_09="#776E71"           # Bright Black
export COLOR_10="#EF6155"           # Bright Red (Command error)
export COLOR_11="#48B685"           # Bright Green (Exec)
export COLOR_12="#FEC418"           # Bright Yellow
export COLOR_13="#06B6EF"           # Bright Blue (Folder)
export COLOR_14="#815BA4"           # Bright Magenta
export COLOR_15="#5BC4BF"           # Bright Cyan
export COLOR_16="#E7E9DB"           # Bright White

export BACKGROUND_COLOR="#2F1E2E"   # Background
export FOREGROUND_COLOR="#A39E9B"   # Foreground (Text)

export CURSOR_COLOR="#A39E9B" # Cursor

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
