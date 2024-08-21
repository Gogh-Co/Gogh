#!/usr/bin/env bash

export PROFILE_NAME="Base4Tone Classic R"

export COLOR_01="#1e1d20"           # Black (Host)
export COLOR_02="#d53975"           # Red (Syntax string)
export COLOR_03="#6577ec"           # Green (Command)
export COLOR_04="#a0acf8"           # Yellow (Command second)
export COLOR_05="#af88f2"           # Blue (Path)
export COLOR_06="#d763e9"           # Magenta (Syntax var)
export COLOR_07="#8493f6"           # Cyan (Prompt)
export COLOR_08="#eae8ed"           # White

export COLOR_09="#09070d"           # Bright Black
export COLOR_10="#eb75a2"           # Bright Red (Command error)
export COLOR_11="#aeb8f9"           # Bright Green (Exec)
export COLOR_12="#c6cdfb"           # Bright Yellow
export COLOR_13="#ddcbfb"           # Bright Blue (Folder)
export COLOR_14="#e17ef1"           # Bright Magenta
export COLOR_15="#d6c2fa"           # Bright Cyan
export COLOR_16="#f7f6f9"           # Bright White

export BACKGROUND_COLOR="#1e1d20"   # Background
export FOREGROUND_COLOR="#98949e"   # Foreground (Text)

export CURSOR_COLOR="#6f7285" # Cursor

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
