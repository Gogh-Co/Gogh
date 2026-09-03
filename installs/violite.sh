#!/usr/bin/env bash

export PROFILE_NAME="Violite"

export COLOR_01="#241C36"           # Black (Host)
export COLOR_02="#EC7979"           # Red (Syntax string)
export COLOR_03="#79ECB3"           # Green (Command)
export COLOR_04="#ECE279"           # Yellow (Command second)
export COLOR_05="#A979EC"           # Blue (Path)
export COLOR_06="#EC79EC"           # Magenta (Syntax var)
export COLOR_07="#79ECEC"           # Cyan (Prompt)
export COLOR_08="#EEF4F6"           # White

export COLOR_09="#56447A"           # Bright Black
export COLOR_10="#EF8F8F"           # Bright Red (Command error)
export COLOR_11="#9FEFBF"           # Bright Green (Exec)
export COLOR_12="#EFE78F"           # Bright Yellow
export COLOR_13="#B78FEF"           # Bright Blue (Folder)
export COLOR_14="#EF8FCF"           # Bright Magenta
export COLOR_15="#9FEFEF"           # Bright Cyan
export COLOR_16="#F8FAFC"           # Bright White

export BACKGROUND_COLOR="#241C36"   # Background
export FOREGROUND_COLOR="#EEF4F6"   # Foreground (Text)

export CURSOR_COLOR="#EEF4F6" # Cursor

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
