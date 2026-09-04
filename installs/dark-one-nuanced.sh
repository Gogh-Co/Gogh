#!/usr/bin/env bash

export PROFILE_NAME="Dark One Nuanced"

export COLOR_01="#3F4451"           # Black (Host)
export COLOR_02="#E06C75"           # Red (Syntax string)
export COLOR_03="#98C379"           # Green (Command)
export COLOR_04="#D19A66"           # Yellow (Command second)
export COLOR_05="#61AFEF"           # Blue (Path)
export COLOR_06="#C678DD"           # Magenta (Syntax var)
export COLOR_07="#56B6C2"           # Cyan (Prompt)
export COLOR_08="#E6E6E6"           # White

export COLOR_09="#4F5666"           # Bright Black
export COLOR_10="#FF7B86"           # Bright Red (Command error)
export COLOR_11="#B1E18B"           # Bright Green (Exec)
export COLOR_12="#EFB074"           # Bright Yellow
export COLOR_13="#67CDFF"           # Bright Blue (Folder)
export COLOR_14="#E48BFF"           # Bright Magenta
export COLOR_15="#63D4E0"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#282C34"   # Background
export FOREGROUND_COLOR="#ABB2BF"   # Foreground (Text)

export CURSOR_COLOR="#ABB2BF" # Cursor

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
