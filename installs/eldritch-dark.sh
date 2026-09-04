#!/usr/bin/env bash

export PROFILE_NAME="Eldritch Dark"

export COLOR_01="#21222C"           # Black (Host)
export COLOR_02="#F9515D"           # Red (Syntax string)
export COLOR_03="#37F499"           # Green (Command)
export COLOR_04="#E9F941"           # Yellow (Command second)
export COLOR_05="#9071F4"           # Blue (Path)
export COLOR_06="#F265B5"           # Magenta (Syntax var)
export COLOR_07="#04D1F9"           # Cyan (Prompt)
export COLOR_08="#EBFAFA"           # White

export COLOR_09="#7081D0"           # Bright Black
export COLOR_10="#F16C75"           # Bright Red (Command error)
export COLOR_11="#69F8B3"           # Bright Green (Exec)
export COLOR_12="#F1FC79"           # Bright Yellow
export COLOR_13="#A48CF2"           # Bright Blue (Folder)
export COLOR_14="#FD92CE"           # Bright Magenta
export COLOR_15="#66E4FD"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#171928"   # Background
export FOREGROUND_COLOR="#EBFAFA"   # Foreground (Text)

export CURSOR_COLOR="#EBFAFA" # Cursor

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
