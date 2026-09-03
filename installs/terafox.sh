#!/usr/bin/env bash

export PROFILE_NAME="Terafox"

export COLOR_01="#2F3239"           # Black (Host)
export COLOR_02="#E85C51"           # Red (Syntax string)
export COLOR_03="#7AA4A1"           # Green (Command)
export COLOR_04="#FDA47F"           # Yellow (Command second)
export COLOR_05="#5A93AA"           # Blue (Path)
export COLOR_06="#AD5C7C"           # Magenta (Syntax var)
export COLOR_07="#A1CDD8"           # Cyan (Prompt)
export COLOR_08="#EBEBEB"           # White

export COLOR_09="#4E5157"           # Bright Black
export COLOR_10="#EB746B"           # Bright Red (Command error)
export COLOR_11="#8EB2AF"           # Bright Green (Exec)
export COLOR_12="#FDB292"           # Bright Yellow
export COLOR_13="#73A3B7"           # Bright Blue (Folder)
export COLOR_14="#B97490"           # Bright Magenta
export COLOR_15="#AFD4DE"           # Bright Cyan
export COLOR_16="#EEEEEE"           # Bright White

export BACKGROUND_COLOR="#152528"   # Background
export FOREGROUND_COLOR="#E6EAEA"   # Foreground (Text)

export CURSOR_COLOR="#E6EAEA" # Cursor

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
