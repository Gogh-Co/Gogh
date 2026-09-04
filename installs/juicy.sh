#!/usr/bin/env bash

export PROFILE_NAME="Juicy"

export COLOR_01="#2E3436"           # Black (Host)
export COLOR_02="#FF0945"           # Red (Syntax string)
export COLOR_03="#1AFF81"           # Green (Command)
export COLOR_04="#FFF64A"           # Yellow (Command second)
export COLOR_05="#2BF1FF"           # Blue (Path)
export COLOR_06="#7B68EE"           # Magenta (Syntax var)
export COLOR_07="#98F4FF"           # Cyan (Prompt)
export COLOR_08="#D3D7CF"           # White

export COLOR_09="#555753"           # Bright Black
export COLOR_10="#FF0945"           # Bright Red (Command error)
export COLOR_11="#1AFF81"           # Bright Green (Exec)
export COLOR_12="#FFF64A"           # Bright Yellow
export COLOR_13="#2BF1FF"           # Bright Blue (Folder)
export COLOR_14="#7B68EE"           # Bright Magenta
export COLOR_15="#98F4FF"           # Bright Cyan
export COLOR_16="#EEEEEC"           # Bright White

export BACKGROUND_COLOR="#212121"   # Background
export FOREGROUND_COLOR="#FCFCFC"   # Foreground (Text)

export CURSOR_COLOR="#FCFCFC" # Cursor

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
