#!/usr/bin/env bash

export PROFILE_NAME="Astrodark"

export COLOR_01="#111317"           # Black (Host)
export COLOR_02="#F8747E"           # Red (Syntax string)
export COLOR_03="#75AD47"           # Green (Command)
export COLOR_04="#D09214"           # Yellow (Command second)
export COLOR_05="#50A4E9"           # Blue (Path)
export COLOR_06="#CC83E3"           # Magenta (Syntax var)
export COLOR_07="#00B298"           # Cyan (Prompt)
export COLOR_08="#ADB0BB"           # White

export COLOR_09="#576176"           # Bright Black
export COLOR_10="#FAA5AB"           # Bright Red (Command error)
export COLOR_11="#A5CD84"           # Bright Green (Exec)
export COLOR_12="#EFBD58"           # Bright Yellow
export COLOR_13="#8DC3F1"           # Bright Blue (Folder)
export COLOR_14="#DEAEED"           # Bright Magenta
export COLOR_15="#27FFDF"           # Bright Cyan
export COLOR_16="#CACCD3"           # Bright White

export BACKGROUND_COLOR="#1A1D23"   # Background
export FOREGROUND_COLOR="#9B9FA9"   # Foreground (Text)

export CURSOR_COLOR="#CACCD3" # Cursor

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
