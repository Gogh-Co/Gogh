#!/usr/bin/env bash

export PROFILE_NAME="Violet Dark"

export COLOR_01="#56595C"           # Black (Host)
export COLOR_02="#C94C22"           # Red (Syntax string)
export COLOR_03="#85981C"           # Green (Command)
export COLOR_04="#B4881D"           # Yellow (Command second)
export COLOR_05="#2E8BCE"           # Blue (Path)
export COLOR_06="#D13A82"           # Magenta (Syntax var)
export COLOR_07="#32A198"           # Cyan (Prompt)
export COLOR_08="#C9C6BD"           # White

export COLOR_09="#45484B"           # Bright Black
export COLOR_10="#BD3613"           # Bright Red (Command error)
export COLOR_11="#738A04"           # Bright Green (Exec)
export COLOR_12="#A57705"           # Bright Yellow
export COLOR_13="#2176C7"           # Bright Blue (Folder)
export COLOR_14="#C61C6F"           # Bright Magenta
export COLOR_15="#259286"           # Bright Cyan
export COLOR_16="#C9C6BD"           # Bright White

export BACKGROUND_COLOR="#1C1D1F"   # Background
export FOREGROUND_COLOR="#708284"   # Foreground (Text)

export CURSOR_COLOR="#708284" # Cursor

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
