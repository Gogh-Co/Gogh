#!/usr/bin/env bash

export PROFILE_NAME="Brushtrees"

export COLOR_01="#E3EFEF"           # Black (Host)
export COLOR_02="#B38686"           # Red (Syntax string)
export COLOR_03="#87B386"           # Green (Command)
export COLOR_04="#AAB386"           # Yellow (Command second)
export COLOR_05="#868CB3"           # Blue (Path)
export COLOR_06="#B386B2"           # Magenta (Syntax var)
export COLOR_07="#86B3B3"           # Cyan (Prompt)
export COLOR_08="#6D828E"           # White

export COLOR_09="#98AFB5"           # Bright Black
export COLOR_10="#B38686"           # Bright Red (Command error)
export COLOR_11="#87B386"           # Bright Green (Exec)
export COLOR_12="#AAB386"           # Bright Yellow
export COLOR_13="#868CB3"           # Bright Blue (Folder)
export COLOR_14="#B386B2"           # Bright Magenta
export COLOR_15="#86B3B3"           # Bright Cyan
export COLOR_16="#485867"           # Bright White

export BACKGROUND_COLOR="#E3EFEF"   # Background
export FOREGROUND_COLOR="#6D828E"   # Foreground (Text)

export CURSOR_COLOR="#6D828E" # Cursor

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
