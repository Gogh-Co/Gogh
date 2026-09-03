#!/usr/bin/env bash

export PROFILE_NAME="Gruvbox Material"

export COLOR_01="#141617"           # Black (Host)
export COLOR_02="#EA6926"           # Red (Syntax string)
export COLOR_03="#C1D041"           # Green (Command)
export COLOR_04="#EECF75"           # Yellow (Command second)
export COLOR_05="#6DA3EC"           # Blue (Path)
export COLOR_06="#FD9BC1"           # Magenta (Syntax var)
export COLOR_07="#FE9D6E"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#4C4C4C"           # Bright Black
export COLOR_10="#D3573B"           # Bright Red (Command error)
export COLOR_11="#C1D041"           # Bright Green (Exec)
export COLOR_12="#EECF75"           # Bright Yellow
export COLOR_13="#2C86FF"           # Bright Blue (Folder)
export COLOR_14="#FD9BC1"           # Bright Magenta
export COLOR_15="#92A5DF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#1D2021"   # Background
export FOREGROUND_COLOR="#D4BE98"   # Foreground (Text)

export CURSOR_COLOR="#FFFFFF" # Cursor

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
