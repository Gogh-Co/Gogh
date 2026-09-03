#!/usr/bin/env bash

export PROFILE_NAME="Sequoia Moonlight Dark"

export COLOR_01="#131317"           # Black (Host)
export COLOR_02="#F58EE0"           # Red (Syntax string)
export COLOR_03="#8EB6F5"           # Green (Command)
export COLOR_04="#9898A6"           # Yellow (Command second)
export COLOR_05="#C58FFF"           # Blue (Path)
export COLOR_06="#FDFDFE"           # Magenta (Syntax var)
export COLOR_07="#FFBB88"           # Cyan (Prompt)
export COLOR_08="#868690"           # White

export COLOR_09="#575861"           # Bright Black
export COLOR_10="#F58EE0"           # Bright Red (Command error)
export COLOR_11="#8EB6F5"           # Bright Green (Exec)
export COLOR_12="#9898A6"           # Bright Yellow
export COLOR_13="#C58FFF"           # Bright Blue (Folder)
export COLOR_14="#FDFDFE"           # Bright Magenta
export COLOR_15="#FFBB88"           # Bright Cyan
export COLOR_16="#868690"           # Bright White

export BACKGROUND_COLOR="#0F1014"   # Background
export FOREGROUND_COLOR="#868690"   # Foreground (Text)

export CURSOR_COLOR="#43444D" # Cursor

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
