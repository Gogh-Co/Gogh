#!/usr/bin/env bash

export PROFILE_NAME="Base4Tone Classic Q"

export COLOR_01="#1D1D20"           # Black (Host)
export COLOR_02="#D4359A"           # Red (Syntax string)
export COLOR_03="#4287F5"           # Green (Command)
export COLOR_04="#88B4FC"           # Yellow (Command second)
export COLOR_05="#A095F3"           # Blue (Path)
export COLOR_06="#BA6CEA"           # Magenta (Syntax var)
export COLOR_07="#659EFB"           # Cyan (Prompt)
export COLOR_08="#E9E8ED"           # White

export COLOR_09="#08070D"           # Bright Black
export COLOR_10="#EB75C0"           # Bright Red (Command error)
export COLOR_11="#9CC1FC"           # Bright Green (Exec)
export COLOR_12="#C2D9FF"           # Bright Yellow
export COLOR_13="#D9D5FC"           # Bright Blue (Folder)
export COLOR_14="#C988F2"           # Bright Magenta
export COLOR_15="#D1CBFB"           # Bright Cyan
export COLOR_16="#F6F6F9"           # Bright White

export BACKGROUND_COLOR="#1D1D20"   # Background
export FOREGROUND_COLOR="#95949E"   # Foreground (Text)

export CURSOR_COLOR="#67768E" # Cursor

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
