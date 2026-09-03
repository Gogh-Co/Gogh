#!/usr/bin/env bash

export PROFILE_NAME="Sequoia Retro Dark"

export COLOR_01="#131317"           # Black (Host)
export COLOR_02="#829FA7"           # Red (Syntax string)
export COLOR_03="#648F68"           # Green (Command)
export COLOR_04="#DA674B"           # Yellow (Command second)
export COLOR_05="#5C87A4"           # Blue (Path)
export COLOR_06="#E8B246"           # Magenta (Syntax var)
export COLOR_07="#A27E57"           # Cyan (Prompt)
export COLOR_08="#868690"           # White

export COLOR_09="#575861"           # Bright Black
export COLOR_10="#E8B246"           # Bright Red (Command error)
export COLOR_11="#648F68"           # Bright Green (Exec)
export COLOR_12="#DA674B"           # Bright Yellow
export COLOR_13="#5C87A4"           # Bright Blue (Folder)
export COLOR_14="#829FA7"           # Bright Magenta
export COLOR_15="#A27E57"           # Bright Cyan
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
