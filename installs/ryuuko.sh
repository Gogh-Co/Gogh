#!/usr/bin/env bash

export PROFILE_NAME="Ryuuko"

export COLOR_01="#2C3941"           # Black (Host)
export COLOR_02="#865F5B"           # Red (Syntax string)
export COLOR_03="#66907D"           # Green (Command)
export COLOR_04="#B1A990"           # Yellow (Command second)
export COLOR_05="#6A8E95"           # Blue (Path)
export COLOR_06="#B18A73"           # Magenta (Syntax var)
export COLOR_07="#88B2AC"           # Cyan (Prompt)
export COLOR_08="#ECECEC"           # White

export COLOR_09="#5D7079"           # Bright Black
export COLOR_10="#865F5B"           # Bright Red (Command error)
export COLOR_11="#66907D"           # Bright Green (Exec)
export COLOR_12="#B1A990"           # Bright Yellow
export COLOR_13="#6A8E95"           # Bright Blue (Folder)
export COLOR_14="#B18A73"           # Bright Magenta
export COLOR_15="#88B2AC"           # Bright Cyan
export COLOR_16="#ECECEC"           # Bright White

export BACKGROUND_COLOR="#2C3941"   # Background
export FOREGROUND_COLOR="#ECECEC"   # Foreground (Text)

export CURSOR_COLOR="#ECECEC" # Cursor

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
