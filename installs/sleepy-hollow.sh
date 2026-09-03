#!/usr/bin/env bash

export PROFILE_NAME="Sleepy Hollow"

export COLOR_01="#572100"           # Black (Host)
export COLOR_02="#BA3934"           # Red (Syntax string)
export COLOR_03="#91773F"           # Green (Command)
export COLOR_04="#B55600"           # Yellow (Command second)
export COLOR_05="#5F63B4"           # Blue (Path)
export COLOR_06="#A17C7B"           # Magenta (Syntax var)
export COLOR_07="#8FAEA9"           # Cyan (Prompt)
export COLOR_08="#AF9A91"           # White

export COLOR_09="#4E4B61"           # Bright Black
export COLOR_10="#D9443F"           # Bright Red (Command error)
export COLOR_11="#D6B04E"           # Bright Green (Exec)
export COLOR_12="#F66813"           # Bright Yellow
export COLOR_13="#8086EF"           # Bright Blue (Folder)
export COLOR_14="#E2C2BB"           # Bright Magenta
export COLOR_15="#A4DCE7"           # Bright Cyan
export COLOR_16="#D2C7A9"           # Bright White

export BACKGROUND_COLOR="#121214"   # Background
export FOREGROUND_COLOR="#AF9A91"   # Foreground (Text)

export CURSOR_COLOR="#AF9A91" # Cursor

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
