#!/usr/bin/env bash

export PROFILE_NAME="Retrowave Light"

export COLOR_01="#BFBA9C"           # Black (Host)
export COLOR_02="#9C4E27"           # Red (Syntax string)
export COLOR_03="#788663"           # Green (Command)
export COLOR_04="#9B6D18"           # Yellow (Command second)
export COLOR_05="#1C6470"           # Blue (Path)
export COLOR_06="#A31B42"           # Magenta (Syntax var)
export COLOR_07="#4A8E7C"           # Cyan (Prompt)
export COLOR_08="#5C4B51"           # White

export COLOR_09="#9B977F"           # Bright Black
export COLOR_10="#68341A"           # Bright Red (Command error)
export COLOR_11="#4E5641"           # Bright Green (Exec)
export COLOR_12="#7A5512"           # Bright Yellow
export COLOR_13="#113F47"           # Bright Blue (Folder)
export COLOR_14="#681A30"           # Bright Magenta
export COLOR_15="#2D5B4F"           # Bright Cyan
export COLOR_16="#3D3135"           # Bright White

export BACKGROUND_COLOR="#F2EBBF"   # Background
export FOREGROUND_COLOR="#5C4B51"   # Foreground (Text)

export CURSOR_COLOR="#5C4B51" # Cursor

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
