#!/usr/bin/env bash

export PROFILE_NAME="Penumbra Light Contrast Plus"

export COLOR_01="#FFFDFB"           # Black (Host)
export COLOR_02="#DF7F78"           # Red (Syntax string)
export COLOR_03="#50B584"           # Green (Command)
export COLOR_04="#9CA748"           # Yellow (Command second)
export COLOR_05="#61A3E6"           # Blue (Path)
export COLOR_06="#A48FE1"           # Magenta (Syntax var)
export COLOR_07="#00B3C2"           # Cyan (Prompt)
export COLOR_08="#636363"           # White

export COLOR_09="#CECECE"           # Bright Black
export COLOR_10="#DF7F78"           # Bright Red (Command error)
export COLOR_11="#50B584"           # Bright Green (Exec)
export COLOR_12="#9CA748"           # Bright Yellow
export COLOR_13="#61A3E6"           # Bright Blue (Folder)
export COLOR_14="#A48FE1"           # Bright Magenta
export COLOR_15="#00B3C2"           # Bright Cyan
export COLOR_16="#181B1F"           # Bright White

export BACKGROUND_COLOR="#FFFDFB"   # Background
export FOREGROUND_COLOR="#636363"   # Foreground (Text)

export CURSOR_COLOR="#636363" # Cursor

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
