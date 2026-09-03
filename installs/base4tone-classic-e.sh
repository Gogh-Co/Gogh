#!/usr/bin/env bash

export PROFILE_NAME="Base4Tone Classic E"

export COLOR_01="#21211C"           # Black (Host)
export COLOR_02="#088EA0"           # Red (Syntax string)
export COLOR_03="#C27905"           # Green (Command)
export COLOR_04="#E8A02C"           # Yellow (Command second)
export COLOR_05="#B9CF17"           # Blue (Path)
export COLOR_06="#5CBA21"           # Magenta (Syntax var)
export COLOR_07="#DC9118"           # Cyan (Prompt)
export COLOR_08="#EDEEE8"           # White

export COLOR_09="#0D0D07"           # Bright Black
export COLOR_10="#25BCD0"           # Bright Red (Command error)
export COLOR_11="#EAA83E"           # Bright Green (Exec)
export COLOR_12="#F3CD91"           # Bright Yellow
export COLOR_13="#EEF6B1"           # Bright Blue (Folder)
export COLOR_14="#69D425"           # Bright Magenta
export COLOR_15="#E6F28C"           # Bright Cyan
export COLOR_16="#F9F9F6"           # Bright White

export BACKGROUND_COLOR="#21211C"   # Background
export FOREGROUND_COLOR="#A0A290"   # Foreground (Text)

export CURSOR_COLOR="#877D6E" # Cursor

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
