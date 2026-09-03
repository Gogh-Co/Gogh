#!/usr/bin/env bash

export PROFILE_NAME="Purplepeter"

export COLOR_01="#0A0520"           # Black (Host)
export COLOR_02="#FF796D"           # Red (Syntax string)
export COLOR_03="#99B481"           # Green (Command)
export COLOR_04="#EFDFAC"           # Yellow (Command second)
export COLOR_05="#66D9EF"           # Blue (Path)
export COLOR_06="#E78FCD"           # Magenta (Syntax var)
export COLOR_07="#BA8CFF"           # Cyan (Prompt)
export COLOR_08="#FFBA81"           # White

export COLOR_09="#100B23"           # Bright Black
export COLOR_10="#F99F92"           # Bright Red (Command error)
export COLOR_11="#B4BE8F"           # Bright Green (Exec)
export COLOR_12="#F2E9BF"           # Bright Yellow
export COLOR_13="#79DAED"           # Bright Blue (Folder)
export COLOR_14="#BA91D4"           # Bright Magenta
export COLOR_15="#A0A0D6"           # Bright Cyan
export COLOR_16="#B9AED3"           # Bright White

export BACKGROUND_COLOR="#2A1A4A"   # Background
export FOREGROUND_COLOR="#ECE7FA"   # Foreground (Text)

export CURSOR_COLOR="#C7C7C7" # Cursor

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
