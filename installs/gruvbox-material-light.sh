#!/usr/bin/env bash

export PROFILE_NAME="Gruvbox Material Light"

export COLOR_01="#F2E5BC"           # Black (Host)
export COLOR_02="#C14A4A"           # Red (Syntax string)
export COLOR_03="#6C782E"           # Green (Command)
export COLOR_04="#B47109"           # Yellow (Command second)
export COLOR_05="#45707A"           # Blue (Path)
export COLOR_06="#945E80"           # Magenta (Syntax var)
export COLOR_07="#4C7A5D"           # Cyan (Prompt)
export COLOR_08="#654735"           # White

export COLOR_09="#F2E5BC"           # Bright Black
export COLOR_10="#C14A4A"           # Bright Red (Command error)
export COLOR_11="#6C782E"           # Bright Green (Exec)
export COLOR_12="#B47109"           # Bright Yellow
export COLOR_13="#45707A"           # Bright Blue (Folder)
export COLOR_14="#945E80"           # Bright Magenta
export COLOR_15="#4C7A5D"           # Bright Cyan
export COLOR_16="#654735"           # Bright White

export BACKGROUND_COLOR="#FBF1C7"   # Background
export FOREGROUND_COLOR="#654735"   # Foreground (Text)

export CURSOR_COLOR="#654735" # Cursor

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
