#!/usr/bin/env bash

export PROFILE_NAME="Kaolin Galaxy"

export COLOR_01="#212026"           # Black (Host)
export COLOR_02="#EF6787"           # Red (Syntax string)
export COLOR_03="#49BDB0"           # Green (Command)
export COLOR_04="#EED891"           # Yellow (Command second)
export COLOR_05="#41B0F3"           # Blue (Path)
export COLOR_06="#CEA2CA"           # Magenta (Syntax var)
export COLOR_07="#6BD9DB"           # Cyan (Prompt)
export COLOR_08="#E6E6E8"           # White

export COLOR_09="#615B75"           # Bright Black
export COLOR_10="#D6224D"           # Bright Red (Command error)
export COLOR_11="#6DD797"           # Bright Green (Exec)
export COLOR_12="#F5C791"           # Bright Yellow
export COLOR_13="#2A57CC"           # Bright Blue (Folder)
export COLOR_14="#9D81BA"           # Bright Magenta
export COLOR_15="#0BC9CF"           # Bright Cyan
export COLOR_16="#F2F2F2"           # Bright White

export BACKGROUND_COLOR="#212026"   # Background
export FOREGROUND_COLOR="#E6E6E8"   # Foreground (Text)

export CURSOR_COLOR="#E6E6E8" # Cursor

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
