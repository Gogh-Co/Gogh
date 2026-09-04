#!/usr/bin/env bash

export PROFILE_NAME="Chesterish"

export COLOR_01="#293340"           # Black (Host)
export COLOR_02="#E17E85"           # Red (Syntax string)
export COLOR_03="#61BA86"           # Green (Command)
export COLOR_04="#FFEC8E"           # Yellow (Command second)
export COLOR_05="#4CB2FF"           # Blue (Path)
export COLOR_06="#BE86E3"           # Magenta (Syntax var)
export COLOR_07="#2DCED0"           # Cyan (Prompt)
export COLOR_08="#CDD2E9"           # White

export COLOR_09="#546386"           # Bright Black
export COLOR_10="#E17E85"           # Bright Red (Command error)
export COLOR_11="#61BA86"           # Bright Green (Exec)
export COLOR_12="#FFEC8E"           # Bright Yellow
export COLOR_13="#4CB2FF"           # Bright Blue (Folder)
export COLOR_14="#BE86E3"           # Bright Magenta
export COLOR_15="#2DCED0"           # Bright Cyan
export COLOR_16="#CDD2E9"           # Bright White

export BACKGROUND_COLOR="#293340"   # Background
export FOREGROUND_COLOR="#CDD2E9"   # Foreground (Text)

export CURSOR_COLOR="#CDD2E9" # Cursor

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
