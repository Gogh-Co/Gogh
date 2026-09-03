#!/usr/bin/env bash

export PROFILE_NAME="Prism"

export COLOR_01="#060C18"           # Black (Host)
export COLOR_02="#FF7192"           # Red (Syntax string)
export COLOR_03="#71E0B0"           # Green (Command)
export COLOR_04="#FAD77C"           # Yellow (Command second)
export COLOR_05="#47B3FF"           # Blue (Path)
export COLOR_06="#9DA9FF"           # Magenta (Syntax var)
export COLOR_07="#31DCF2"           # Cyan (Prompt)
export COLOR_08="#B6C4DC"           # White

export COLOR_09="#5E6F90"           # Bright Black
export COLOR_10="#FF96AD"           # Bright Red (Command error)
export COLOR_11="#93ECC7"           # Bright Green (Exec)
export COLOR_12="#FCA76D"           # Bright Yellow
export COLOR_13="#77CAFF"           # Bright Blue (Folder)
export COLOR_14="#B8C1FF"           # Bright Magenta
export COLOR_15="#6CEAFB"           # Bright Cyan
export COLOR_16="#EAF1FB"           # Bright White

export BACKGROUND_COLOR="#0B1326"   # Background
export FOREGROUND_COLOR="#D7E3F4"   # Foreground (Text)

export CURSOR_COLOR="#56D5FF" # Cursor

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
