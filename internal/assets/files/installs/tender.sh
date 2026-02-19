#!/usr/bin/env bash

export PROFILE_NAME="Tender"

export COLOR_01="#1D1D1D"           # Black (Host)
export COLOR_02="#C5152F"           # Red (Syntax string)
export COLOR_03="#C9D05C"           # Green (Command)
export COLOR_04="#FFC24B"           # Yellow (Command second)
export COLOR_05="#B3DEEF"           # Blue (Path)
export COLOR_06="#D3B987"           # Magenta (Syntax var)
export COLOR_07="#73CEF4"           # Cyan (Prompt)
export COLOR_08="#EEEEEE"           # White

export COLOR_09="#323232"           # Bright Black
export COLOR_10="#F43753"           # Bright Red (Command error)
export COLOR_11="#D9E066"           # Bright Green (Exec)
export COLOR_12="#FACC72"           # Bright Yellow
export COLOR_13="#C0EAFB"           # Bright Blue (Folder)
export COLOR_14="#EFD093"           # Bright Magenta
export COLOR_15="#A1D6EC"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#282828"   # Background
export FOREGROUND_COLOR="#EEEEEE"   # Foreground (Text)

export CURSOR_COLOR="#EEEEEE" # Cursor

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
