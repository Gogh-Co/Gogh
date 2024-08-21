#!/usr/bin/env bash

export PROFILE_NAME="Base4Tone Classic D"

export COLOR_01="#21211c"           # Black (Host)
export COLOR_02="#049582"           # Red (Syntax string)
export COLOR_03="#da6b2b"           # Green (Command)
export COLOR_04="#ee9968"           # Yellow (Command second)
export COLOR_05="#cfb617"           # Blue (Path)
export COLOR_06="#82c115"           # Magenta (Syntax var)
export COLOR_07="#e6854d"           # Cyan (Prompt)
export COLOR_08="#eeede8"           # White

export COLOR_09="#0d0c07"           # Bright Black
export COLOR_10="#1cc4ae"           # Bright Red (Command error)
export COLOR_11="#f0a57a"           # Bright Green (Exec)
export COLOR_12="#f5c1a3"           # Bright Yellow
export COLOR_13="#f6edb1"           # Bright Blue (Folder)
export COLOR_14="#95dc18"           # Bright Magenta
export COLOR_15="#f2e58c"           # Bright Cyan
export COLOR_16="#f9f8f6"           # Bright White

export BACKGROUND_COLOR="#21211c"   # Background
export FOREGROUND_COLOR="#a2a090"   # Foreground (Text)

export CURSOR_COLOR="#85776f" # Cursor

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
