#!/usr/bin/env bash

export PROFILE_NAME="Pyrokai"

export COLOR_01="#242120"           # Black (Host)
export COLOR_02="#EC6785"           # Red (Syntax string)
export COLOR_03="#75AD2F"           # Green (Command)
export COLOR_04="#BB9500"           # Yellow (Command second)
export COLOR_05="#2AA0F9"           # Blue (Path)
export COLOR_06="#E76899"           # Magenta (Syntax var)
export COLOR_07="#00AEBD"           # Cyan (Prompt)
export COLOR_08="#B4AFAD"           # White

export COLOR_09="#807C7A"           # Bright Black
export COLOR_10="#FA8099"           # Bright Red (Command error)
export COLOR_11="#8BBF53"           # Bright Green (Exec)
export COLOR_12="#D0A70E"           # Bright Yellow
export COLOR_13="#5BB3FF"           # Bright Blue (Folder)
export COLOR_14="#F681AC"           # Bright Magenta
export COLOR_15="#00C3D3"           # Bright Cyan
export COLOR_16="#FAF6F5"           # Bright White

export BACKGROUND_COLOR="#151312"   # Background
export FOREGROUND_COLOR="#FAF6F5"   # Foreground (Text)

export CURSOR_COLOR="#EA7332" # Cursor

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
