#!/usr/bin/env bash

export PROFILE_NAME="Ura"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#C21B6F"           # Red (Syntax string)
export COLOR_03="#6FC21B"           # Green (Command)
export COLOR_04="#C26F1B"           # Yellow (Command second)
export COLOR_05="#1B6FC2"           # Blue (Path)
export COLOR_06="#6F1BC2"           # Magenta (Syntax var)
export COLOR_07="#1BC26F"           # Cyan (Prompt)
export COLOR_08="#808080"           # White

export COLOR_09="#808080"           # Bright Black
export COLOR_10="#EE84B9"           # Bright Red (Command error)
export COLOR_11="#B9EE84"           # Bright Green (Exec)
export COLOR_12="#EEB984"           # Bright Yellow
export COLOR_13="#84B9EE"           # Bright Blue (Folder)
export COLOR_14="#B984EE"           # Bright Magenta
export COLOR_15="#84EEB9"           # Bright Cyan
export COLOR_16="#E5E5E5"           # Bright White

export BACKGROUND_COLOR="#FEFFEE"   # Background
export FOREGROUND_COLOR="#23476A"   # Foreground (Text)

export CURSOR_COLOR="#23476A" # Cursor

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
