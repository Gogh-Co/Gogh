#!/usr/bin/env bash

export PROFILE_NAME="IR Black"

export COLOR_01="#4F4F4F"           # Black (Host)
export COLOR_02="#FA6C60"           # Red (Syntax string)
export COLOR_03="#A8FF60"           # Green (Command)
export COLOR_04="#FFFEB7"           # Yellow (Command second)
export COLOR_05="#96CAFE"           # Blue (Path)
export COLOR_06="#FA73FD"           # Magenta (Syntax var)
export COLOR_07="#C6C5FE"           # Cyan (Prompt)
export COLOR_08="#EFEDEF"           # White

export COLOR_09="#7B7B7B"           # Bright Black
export COLOR_10="#FCB6B0"           # Bright Red (Command error)
export COLOR_11="#CFFFAB"           # Bright Green (Exec)
export COLOR_12="#FFFFCC"           # Bright Yellow
export COLOR_13="#B5DCFF"           # Bright Blue (Folder)
export COLOR_14="#FB9CFE"           # Bright Magenta
export COLOR_15="#E0E0FE"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#000000"   # Background
export FOREGROUND_COLOR="#F1F1F1"   # Foreground (Text)

export CURSOR_COLOR="#808080" # Cursor

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
