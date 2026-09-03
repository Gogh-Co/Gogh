#!/usr/bin/env bash

export PROFILE_NAME="Tempus Spring"

export COLOR_01="#283A37"           # Black (Host)
export COLOR_02="#FF8B5F"           # Red (Syntax string)
export COLOR_03="#5EC04D"           # Green (Command)
export COLOR_04="#B0B01A"           # Yellow (Command second)
export COLOR_05="#39BACE"           # Blue (Path)
export COLOR_06="#E99399"           # Magenta (Syntax var)
export COLOR_07="#36C08E"           # Cyan (Prompt)
export COLOR_08="#99AFAE"           # White

export COLOR_09="#2A453D"           # Bright Black
export COLOR_10="#E19E00"           # Bright Red (Command error)
export COLOR_11="#73BE0D"           # Bright Green (Exec)
export COLOR_12="#C6A843"           # Bright Yellow
export COLOR_13="#70AFEF"           # Bright Blue (Folder)
export COLOR_14="#D095E2"           # Bright Magenta
export COLOR_15="#3CBFAF"           # Bright Cyan
export COLOR_16="#B5B8B7"           # Bright White

export BACKGROUND_COLOR="#283A37"   # Background
export FOREGROUND_COLOR="#B5B8B7"   # Foreground (Text)

export CURSOR_COLOR="#B5B8B7" # Cursor

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
