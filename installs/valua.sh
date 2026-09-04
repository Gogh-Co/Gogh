#!/usr/bin/env bash

export PROFILE_NAME="Valua"

export COLOR_01="#131F1F"           # Black (Host)
export COLOR_02="#D7586E"           # Red (Syntax string)
export COLOR_03="#59D678"           # Green (Command)
export COLOR_04="#DFE754"           # Yellow (Command second)
export COLOR_05="#4ED2D2"           # Blue (Path)
export COLOR_06="#A874E0"           # Magenta (Syntax var)
export COLOR_07="#76DBD2"           # Cyan (Prompt)
export COLOR_08="#98C1A3"           # White

export COLOR_09="#3E5C53"           # Bright Black
export COLOR_10="#D7586E"           # Bright Red (Command error)
export COLOR_11="#59D678"           # Bright Green (Exec)
export COLOR_12="#DFE754"           # Bright Yellow
export COLOR_13="#4ED2D2"           # Bright Blue (Folder)
export COLOR_14="#A874E0"           # Bright Magenta
export COLOR_15="#76DBD2"           # Bright Cyan
export COLOR_16="#AACBCB"           # Bright White

export BACKGROUND_COLOR="#131F1F"   # Background
export FOREGROUND_COLOR="#98C1A3"   # Foreground (Text)

export CURSOR_COLOR="#98C1A3" # Cursor

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
