#!/usr/bin/env bash

export PROFILE_NAME="Serendipity Morning"

export COLOR_01="#CCD0DC"           # Black (Host)
export COLOR_02="#C25A4D"           # Red (Syntax string)
export COLOR_03="#2F7AAB"           # Green (Command)
export COLOR_04="#785FD0"           # Yellow (Command second)
export COLOR_05="#6288D8"           # Blue (Path)
export COLOR_06="#629AA5"           # Magenta (Syntax var)
export COLOR_07="#E58678"           # Cyan (Prompt)
export COLOR_08="#3F4363"           # White

export COLOR_09="#505575"           # Bright Black
export COLOR_10="#C25A4D"           # Bright Red (Command error)
export COLOR_11="#2F7AAB"           # Bright Green (Exec)
export COLOR_12="#785FD0"           # Bright Yellow
export COLOR_13="#6288D8"           # Bright Blue (Folder)
export COLOR_14="#629AA5"           # Bright Magenta
export COLOR_15="#E58678"           # Bright Cyan
export COLOR_16="#3F4363"           # Bright White

export BACKGROUND_COLOR="#F6F7FB"   # Background
export FOREGROUND_COLOR="#3F4363"   # Foreground (Text)

export CURSOR_COLOR="#6D7296" # Cursor

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
