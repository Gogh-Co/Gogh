#!/usr/bin/env bash

export PROFILE_NAME="Batman"

export COLOR_01="#1B1D1E"           # Black (Host)
export COLOR_02="#E6DC44"           # Red (Syntax string)
export COLOR_03="#C8BE46"           # Green (Command)
export COLOR_04="#F4FD22"           # Yellow (Command second)
export COLOR_05="#737174"           # Blue (Path)
export COLOR_06="#747271"           # Magenta (Syntax var)
export COLOR_07="#62605F"           # Cyan (Prompt)
export COLOR_08="#C6C5BF"           # White

export COLOR_09="#505354"           # Bright Black
export COLOR_10="#FFF78E"           # Bright Red (Command error)
export COLOR_11="#FFF27D"           # Bright Green (Exec)
export COLOR_12="#FEED6C"           # Bright Yellow
export COLOR_13="#919495"           # Bright Blue (Folder)
export COLOR_14="#9A9A9D"           # Bright Magenta
export COLOR_15="#A3A3A6"           # Bright Cyan
export COLOR_16="#DADBD6"           # Bright White

export BACKGROUND_COLOR="#1B1D1E"   # Background
export FOREGROUND_COLOR="#6F6F6F"   # Foreground (Text)

export CURSOR_COLOR="#FCEF0C" # Cursor

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
