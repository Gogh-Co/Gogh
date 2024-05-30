#!/usr/bin/env bash

export PROFILE_NAME="Kanagawa Dragon"

export COLOR_01="#0D0C0C"           # Black (Host)
export COLOR_02="#C4746E"           # Red (Syntax string)
export COLOR_03="#8A9A7B"           # Green (Command)
export COLOR_04="#C4B28A"           # Yellow (Command second)
export COLOR_05="#8BA4B0"           # Blue (Path)
export COLOR_06="#A292A3"           # Magenta (Syntax var)
export COLOR_07="#8EA4A2"           # Cyan (Prompt)
export COLOR_08="#C8C093"           # White

export COLOR_09="#A6A69C"           # Bright Black
export COLOR_10="#E46876"           # Bright Red (Command error)
export COLOR_11="#87A987"           # Bright Green (Exec)
export COLOR_12="#E6C384"           # Bright Yellow
export COLOR_13="#7FB4CA"           # Bright Blue (Folder)
export COLOR_14="#938AA9"           # Bright Magenta
export COLOR_15="#7AA89F"           # Bright Cyan
export COLOR_16="#C5C9C5"           # Bright White

export BACKGROUND_COLOR="#181616"   # Background
export FOREGROUND_COLOR="#C5C9C5"   # Foreground (Text)

export CURSOR_COLOR="#C8C093" # Cursor

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
