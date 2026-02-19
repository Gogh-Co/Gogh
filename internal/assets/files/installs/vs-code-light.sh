#!/usr/bin/env bash

export PROFILE_NAME="Vs Code Light+"

export COLOR_01="#020202"           # Black (Host)
export COLOR_02="#CD3232"           # Red (Syntax string)
export COLOR_03="#00BC00"           # Green (Command)
export COLOR_04="#A5A900"           # Yellow (Command second)
export COLOR_05="#0752A8"           # Blue (Path)
export COLOR_06="#BC05BC"           # Magenta (Syntax var)
export COLOR_07="#0598BC"           # Cyan (Prompt)
export COLOR_08="#343434"           # White

export COLOR_09="#5E5E5E"           # Bright Black
export COLOR_10="#CD3333"           # Bright Red (Command error)
export COLOR_11="#1BCE1A"           # Bright Green (Exec)
export COLOR_12="#ADBB5B"           # Bright Yellow
export COLOR_13="#0752A8"           # Bright Blue (Folder)
export COLOR_14="#C451CE"           # Bright Magenta
export COLOR_15="#52A8C7"           # Bright Cyan
export COLOR_16="#A6A3A6"           # Bright White

export BACKGROUND_COLOR="#F9F9F9"   # Background
export FOREGROUND_COLOR="#020202"   # Foreground (Text)

export CURSOR_COLOR="#020202" # Cursor

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
