#!/usr/bin/env bash

export PROFILE_NAME="Gruvbox Light Medium"

export COLOR_01="#FBF1C7"           # Black (Host)
export COLOR_02="#9D0006"           # Red (Syntax string)
export COLOR_03="#79740E"           # Green (Command)
export COLOR_04="#B57614"           # Yellow (Command second)
export COLOR_05="#076678"           # Blue (Path)
export COLOR_06="#8F3F71"           # Magenta (Syntax var)
export COLOR_07="#427B58"           # Cyan (Prompt)
export COLOR_08="#504945"           # White

export COLOR_09="#BDAE93"           # Bright Black
export COLOR_10="#9D0006"           # Bright Red (Command error)
export COLOR_11="#79740E"           # Bright Green (Exec)
export COLOR_12="#B57614"           # Bright Yellow
export COLOR_13="#076678"           # Bright Blue (Folder)
export COLOR_14="#8F3F71"           # Bright Magenta
export COLOR_15="#427B58"           # Bright Cyan
export COLOR_16="#282828"           # Bright White

export BACKGROUND_COLOR="#FBF1C7"   # Background
export FOREGROUND_COLOR="#504945"   # Foreground (Text)

export CURSOR_COLOR="#504945" # Cursor

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
