#!/usr/bin/env bash

export PROFILE_NAME="Pnevma"

export COLOR_01="#2F2E2D"           # Black (Host)
export COLOR_02="#A36666"           # Red (Syntax string)
export COLOR_03="#90A57D"           # Green (Command)
export COLOR_04="#D7AF87"           # Yellow (Command second)
export COLOR_05="#7FA5BD"           # Blue (Path)
export COLOR_06="#C79EC4"           # Magenta (Syntax var)
export COLOR_07="#8ADBB4"           # Cyan (Prompt)
export COLOR_08="#D0D0D0"           # White

export COLOR_09="#4A4845"           # Bright Black
export COLOR_10="#D78787"           # Bright Red (Command error)
export COLOR_11="#AFBEA2"           # Bright Green (Exec)
export COLOR_12="#E4C9AF"           # Bright Yellow
export COLOR_13="#A1BDCE"           # Bright Blue (Folder)
export COLOR_14="#D7BEDA"           # Bright Magenta
export COLOR_15="#B1E7DD"           # Bright Cyan
export COLOR_16="#EFEFEF"           # Bright White

export BACKGROUND_COLOR="#1C1C1C"   # Background
export FOREGROUND_COLOR="#D0D0D0"   # Foreground (Text)

export CURSOR_COLOR="#D0D0D0" # Cursor

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
