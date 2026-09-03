#!/usr/bin/env bash

export PROFILE_NAME="One Double Light"

export COLOR_01="#464B57"           # Black (Host)
export COLOR_02="#E45649"           # Red (Syntax string)
export COLOR_03="#50A14F"           # Green (Command)
export COLOR_04="#C18401"           # Yellow (Command second)
export COLOR_05="#0184BC"           # Blue (Path)
export COLOR_06="#A626A4"           # Magenta (Syntax var)
export COLOR_07="#0997B3"           # Cyan (Prompt)
export COLOR_08="#E8D9D9"           # White

export COLOR_09="#0F131E"           # Bright Black
export COLOR_10="#F24C2D"           # Bright Red (Command error)
export COLOR_11="#3DB637"           # Bright Green (Exec)
export COLOR_12="#E09D00"           # Bright Yellow
export COLOR_13="#2E63D6"           # Bright Blue (Folder)
export COLOR_14="#D21FD1"           # Bright Magenta
export COLOR_15="#06B1D8"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#FAFAFA"   # Background
export FOREGROUND_COLOR="#383A42"   # Foreground (Text)

export CURSOR_COLOR="#1A1A1A" # Cursor

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
