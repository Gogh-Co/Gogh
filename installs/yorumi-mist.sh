#!/usr/bin/env bash

export PROFILE_NAME="Yorumi Mist"

export COLOR_01="#060914"           # Black (Host)
export COLOR_02="#4E0E0E"           # Red (Syntax string)
export COLOR_03="#1C4642"           # Green (Command)
export COLOR_04="#543407"           # Yellow (Command second)
export COLOR_05="#0D2C4E"           # Blue (Path)
export COLOR_06="#4C1036"           # Magenta (Syntax var)
export COLOR_07="#104351"           # Cyan (Prompt)
export COLOR_08="#878996"           # White

export COLOR_09="#1D202B"           # Bright Black
export COLOR_10="#913B3B"           # Bright Red (Command error)
export COLOR_11="#697F4D"           # Bright Green (Exec)
export COLOR_12="#A06A2C"           # Bright Yellow
export COLOR_13="#42608A"           # Bright Blue (Folder)
export COLOR_14="#8D3F5A"           # Bright Magenta
export COLOR_15="#478584"           # Bright Cyan
export COLOR_16="#BDBFCB"           # Bright White

export BACKGROUND_COLOR="#BDBFCB"   # Background
export FOREGROUND_COLOR="#060914"   # Foreground (Text)

export CURSOR_COLOR="#060914" # Cursor

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
