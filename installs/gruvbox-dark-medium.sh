#!/usr/bin/env bash

export PROFILE_NAME="Gruvbox Dark Medium"

export COLOR_01="#282828"           # Black (Host)
export COLOR_02="#FB4934"           # Red (Syntax string)
export COLOR_03="#B8BB26"           # Green (Command)
export COLOR_04="#FABD2F"           # Yellow (Command second)
export COLOR_05="#83A598"           # Blue (Path)
export COLOR_06="#D3869B"           # Magenta (Syntax var)
export COLOR_07="#8EC07C"           # Cyan (Prompt)
export COLOR_08="#D5C4A1"           # White

export COLOR_09="#665C54"           # Bright Black
export COLOR_10="#FB4934"           # Bright Red (Command error)
export COLOR_11="#B8BB26"           # Bright Green (Exec)
export COLOR_12="#FABD2F"           # Bright Yellow
export COLOR_13="#83A598"           # Bright Blue (Folder)
export COLOR_14="#D3869B"           # Bright Magenta
export COLOR_15="#8EC07C"           # Bright Cyan
export COLOR_16="#FBF1C7"           # Bright White

export BACKGROUND_COLOR="#282828"   # Background
export FOREGROUND_COLOR="#D5C4A1"   # Foreground (Text)

export CURSOR_COLOR="#D5C4A1" # Cursor

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
