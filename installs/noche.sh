#!/usr/bin/env bash

export PROFILE_NAME="Noche"

export COLOR_01="#0C0E16"           # Black (Host)
export COLOR_02="#E2727E"           # Red (Syntax string)
export COLOR_03="#7CC596"           # Green (Command)
export COLOR_04="#D8C062"           # Yellow (Command second)
export COLOR_05="#7AA0E8"           # Blue (Path)
export COLOR_06="#B79AE0"           # Magenta (Syntax var)
export COLOR_07="#6DD8D0"           # Cyan (Prompt)
export COLOR_08="#CBD4EC"           # White

export COLOR_09="#5A6178"           # Bright Black
export COLOR_10="#E2727E"           # Bright Red (Command error)
export COLOR_11="#7CC596"           # Bright Green (Exec)
export COLOR_12="#D8C062"           # Bright Yellow
export COLOR_13="#7AA0E8"           # Bright Blue (Folder)
export COLOR_14="#B79AE0"           # Bright Magenta
export COLOR_15="#6DD8D0"           # Bright Cyan
export COLOR_16="#E6ECFA"           # Bright White

export BACKGROUND_COLOR="#0C0E16"   # Background
export FOREGROUND_COLOR="#CBD4EC"   # Foreground (Text)

export CURSOR_COLOR="#CBD4EC" # Cursor

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
