#!/usr/bin/env bash

export PROFILE_NAME="Ultra Violet"

export COLOR_01="#242728"           # Black (Host)
export COLOR_02="#FF0090"           # Red (Syntax string)
export COLOR_03="#B5FF00"           # Green (Command)
export COLOR_04="#7FEBFF"           # Yellow (Command second)
export COLOR_05="#47DFFB"           # Blue (Path)
export COLOR_06="#D630FF"           # Magenta (Syntax var)
export COLOR_07="#0EFFBB"           # Cyan (Prompt)
export COLOR_08="#C1C2C2"           # White

export COLOR_09="#818484"           # Bright Black
export COLOR_10="#FB57B4"           # Bright Red (Command error)
export COLOR_11="#DEFF8B"           # Bright Green (Exec)
export COLOR_12="#EBDF86"           # Bright Yellow
export COLOR_13="#7FEBFF"           # Bright Blue (Folder)
export COLOR_14="#E681FF"           # Bright Magenta
export COLOR_15="#68FCD2"           # Bright Cyan
export COLOR_16="#F9F9F4"           # Bright White

export BACKGROUND_COLOR="#242728"   # Background
export FOREGROUND_COLOR="#C1C2C2"   # Foreground (Text)

export CURSOR_COLOR="#C1C2C2" # Cursor

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
