#!/usr/bin/env bash

export PROFILE_NAME="Espresso"

export COLOR_01="#353535"           # Black (Host)
export COLOR_02="#D25252"           # Red (Syntax string)
export COLOR_03="#A5C261"           # Green (Command)
export COLOR_04="#FFC66D"           # Yellow (Command second)
export COLOR_05="#6C99BB"           # Blue (Path)
export COLOR_06="#D197D9"           # Magenta (Syntax var)
export COLOR_07="#BED6FF"           # Cyan (Prompt)
export COLOR_08="#EEEEEC"           # White

export COLOR_09="#535353"           # Bright Black
export COLOR_10="#F00C0C"           # Bright Red (Command error)
export COLOR_11="#C2E075"           # Bright Green (Exec)
export COLOR_12="#E1E48B"           # Bright Yellow
export COLOR_13="#8AB7D9"           # Bright Blue (Folder)
export COLOR_14="#EFB5F7"           # Bright Magenta
export COLOR_15="#DCF4FF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#323232"   # Background
export FOREGROUND_COLOR="#FFFFFF"   # Foreground (Text)

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
