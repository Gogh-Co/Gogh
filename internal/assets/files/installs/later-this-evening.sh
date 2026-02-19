#!/usr/bin/env bash

export PROFILE_NAME="Later This Evening"

export COLOR_01="#2B2B2B"           # Black (Host)
export COLOR_02="#D45A60"           # Red (Syntax string)
export COLOR_03="#AFBA67"           # Green (Command)
export COLOR_04="#E5D289"           # Yellow (Command second)
export COLOR_05="#A0BAD6"           # Blue (Path)
export COLOR_06="#C092D6"           # Magenta (Syntax var)
export COLOR_07="#91BFB7"           # Cyan (Prompt)
export COLOR_08="#3C3D3D"           # White

export COLOR_09="#454747"           # Bright Black
export COLOR_10="#D3232F"           # Bright Red (Command error)
export COLOR_11="#AABB39"           # Bright Green (Exec)
export COLOR_12="#E5BE39"           # Bright Yellow
export COLOR_13="#6699D6"           # Bright Blue (Folder)
export COLOR_14="#AB53D6"           # Bright Magenta
export COLOR_15="#5FC0AE"           # Bright Cyan
export COLOR_16="#C1C2C2"           # Bright White

export BACKGROUND_COLOR="#222222"   # Background
export FOREGROUND_COLOR="#959595"   # Foreground (Text)

export CURSOR_COLOR="#959595" # Cursor

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
