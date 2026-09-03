#!/usr/bin/env bash

export PROFILE_NAME="CRT Amber"

export COLOR_01="#4C422F"           # Black (Host)
export COLOR_02="#EF4444"           # Red (Syntax string)
export COLOR_03="#84CC16"           # Green (Command)
export COLOR_04="#FDE68A"           # Yellow (Command second)
export COLOR_05="#C084FC"           # Blue (Path)
export COLOR_06="#F97316"           # Magenta (Syntax var)
export COLOR_07="#F59E0B"           # Cyan (Prompt)
export COLOR_08="#D8A657"           # White

export COLOR_09="#544435"           # Bright Black
export COLOR_10="#F26969"           # Bright Red (Command error)
export COLOR_11="#9DD645"           # Bright Green (Exec)
export COLOR_12="#FDEB9F"           # Bright Yellow
export COLOR_13="#CD9DFD"           # Bright Blue (Folder)
export COLOR_14="#FA8F45"           # Bright Magenta
export COLOR_15="#F7B13C"           # Bright Cyan
export COLOR_16="#FFF3C4"           # Bright White

export BACKGROUND_COLOR="#1A1005"   # Background
export FOREGROUND_COLOR="#FFF3C4"   # Foreground (Text)

export CURSOR_COLOR="#FFF3C4" # Cursor

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
