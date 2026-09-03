#!/usr/bin/env bash

export PROFILE_NAME="Night Owlish Light"

export COLOR_01="#011627"           # Black (Host)
export COLOR_02="#D3423E"           # Red (Syntax string)
export COLOR_03="#2AA298"           # Green (Command)
export COLOR_04="#DAAA01"           # Yellow (Command second)
export COLOR_05="#4876D6"           # Blue (Path)
export COLOR_06="#403F53"           # Magenta (Syntax var)
export COLOR_07="#08916A"           # Cyan (Prompt)
export COLOR_08="#7A8181"           # White

export COLOR_09="#7A8181"           # Bright Black
export COLOR_10="#F76E6E"           # Bright Red (Command error)
export COLOR_11="#49D0C5"           # Bright Green (Exec)
export COLOR_12="#DAC26B"           # Bright Yellow
export COLOR_13="#5CA7E4"           # Bright Blue (Folder)
export COLOR_14="#697098"           # Bright Magenta
export COLOR_15="#00C990"           # Bright Cyan
export COLOR_16="#989FB1"           # Bright White

export BACKGROUND_COLOR="#FFFFFF"   # Background
export FOREGROUND_COLOR="#403F53"   # Foreground (Text)

export CURSOR_COLOR="#403F53" # Cursor

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
