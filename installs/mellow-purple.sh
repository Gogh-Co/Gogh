#!/usr/bin/env bash

export PROFILE_NAME="Mellow Purple"

export COLOR_01="#1E0528"           # Black (Host)
export COLOR_02="#00D9E9"           # Red (Syntax string)
export COLOR_03="#05CB0D"           # Green (Command)
export COLOR_04="#955AE7"           # Yellow (Command second)
export COLOR_05="#550068"           # Blue (Path)
export COLOR_06="#8991BB"           # Magenta (Syntax var)
export COLOR_07="#B900B1"           # Cyan (Prompt)
export COLOR_08="#FFEEFF"           # White

export COLOR_09="#320F55"           # Bright Black
export COLOR_10="#00D9E9"           # Bright Red (Command error)
export COLOR_11="#05CB0D"           # Bright Green (Exec)
export COLOR_12="#955AE7"           # Bright Yellow
export COLOR_13="#550068"           # Bright Blue (Folder)
export COLOR_14="#8991BB"           # Bright Magenta
export COLOR_15="#B900B1"           # Bright Cyan
export COLOR_16="#F8C0FF"           # Bright White

export BACKGROUND_COLOR="#1E0528"   # Background
export FOREGROUND_COLOR="#FFEEFF"   # Foreground (Text)

export CURSOR_COLOR="#FFEEFF" # Cursor

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
