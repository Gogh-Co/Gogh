#!/usr/bin/env bash

export PROFILE_NAME="Base4Tone Classic T"

export COLOR_01="#201D20"           # Black (Host)
export COLOR_02="#CE672C"           # Red (Syntax string)
export COLOR_03="#9263E3"           # Green (Command)
export COLOR_04="#B792F6"           # Yellow (Command second)
export COLOR_05="#DB75EB"           # Blue (Path)
export COLOR_06="#E96396"           # Magenta (Syntax var)
export COLOR_07="#A57AF0"           # Cyan (Prompt)
export COLOR_08="#EDE8ED"           # White

export COLOR_09="#0C070D"           # Bright Black
export COLOR_10="#E78B55"           # Bright Red (Command error)
export COLOR_11="#C0A1F7"           # Bright Green (Exec)
export COLOR_12="#D6C2FA"           # Bright Yellow
export COLOR_13="#F1C3F8"           # Bright Blue (Folder)
export COLOR_14="#F17EAA"           # Bright Magenta
export COLOR_15="#EDB1F6"           # Bright Cyan
export COLOR_16="#F8F6F9"           # Bright White

export BACKGROUND_COLOR="#201D20"   # Background
export FOREGROUND_COLOR="#9D949E"   # Foreground (Text)

export CURSOR_COLOR="#797481" # Cursor

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
