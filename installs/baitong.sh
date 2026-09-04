#!/usr/bin/env bash

export PROFILE_NAME="Baitong"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#F77272"           # Red (Syntax string)
export COLOR_03="#33FF33"           # Green (Command)
export COLOR_04="#1AE642"           # Yellow (Command second)
export COLOR_05="#68FDFE"           # Blue (Path)
export COLOR_06="#FF66FF"           # Magenta (Syntax var)
export COLOR_07="#87CEFA"           # Cyan (Prompt)
export COLOR_08="#DBDBD9"           # White

export COLOR_09="#FFFFFF"           # Bright Black
export COLOR_10="#F77272"           # Bright Red (Command error)
export COLOR_11="#33FF33"           # Bright Green (Exec)
export COLOR_12="#1AE642"           # Bright Yellow
export COLOR_13="#68FDFE"           # Bright Blue (Folder)
export COLOR_14="#FF66FF"           # Bright Magenta
export COLOR_15="#68FDFE"           # Bright Cyan
export COLOR_16="#DBDBD9"           # Bright White

export BACKGROUND_COLOR="#112A2A"   # Background
export FOREGROUND_COLOR="#33FF33"   # Foreground (Text)

export CURSOR_COLOR="#33FF33" # Cursor

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
