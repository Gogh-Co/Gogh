#!/usr/bin/env bash

export PROFILE_NAME="Foxnightly"

export COLOR_01="#2A2A2E"           # Black (Host)
export COLOR_02="#B98EFF"           # Red (Syntax string)
export COLOR_03="#FF7DE9"           # Green (Command)
export COLOR_04="#729FCF"           # Yellow (Command second)
export COLOR_05="#66A05B"           # Blue (Path)
export COLOR_06="#75507B"           # Magenta (Syntax var)
export COLOR_07="#ACACAE"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#A40000"           # Bright Black
export COLOR_10="#BF4040"           # Bright Red (Command error)
export COLOR_11="#66A05B"           # Bright Green (Exec)
export COLOR_12="#FFB86C"           # Bright Yellow
export COLOR_13="#729FCF"           # Bright Blue (Folder)
export COLOR_14="#8F5902"           # Bright Magenta
export COLOR_15="#C4A000"           # Bright Cyan
export COLOR_16="#5C3566"           # Bright White

export BACKGROUND_COLOR="#2A2A2E"   # Background
export FOREGROUND_COLOR="#D7D7DB"   # Foreground (Text)

export CURSOR_COLOR="#D7D7DB" # Cursor

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
