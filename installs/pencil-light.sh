#!/usr/bin/env bash

export PROFILE_NAME="Pencil Light"

export COLOR_01="#212121"           # Black (Host)
export COLOR_02="#C30771"           # Red (Syntax string)
export COLOR_03="#10A778"           # Green (Command)
export COLOR_04="#A89C14"           # Yellow (Command second)
export COLOR_05="#008EC4"           # Blue (Path)
export COLOR_06="#523C79"           # Magenta (Syntax var)
export COLOR_07="#20A5BA"           # Cyan (Prompt)
export COLOR_08="#D9D9D9"           # White

export COLOR_09="#424242"           # Bright Black
export COLOR_10="#FB007A"           # Bright Red (Command error)
export COLOR_11="#5FD7AF"           # Bright Green (Exec)
export COLOR_12="#F3E430"           # Bright Yellow
export COLOR_13="#20BBFC"           # Bright Blue (Folder)
export COLOR_14="#6855DE"           # Bright Magenta
export COLOR_15="#4FB8CC"           # Bright Cyan
export COLOR_16="#F1F1F1"           # Bright White

export BACKGROUND_COLOR="#F1F1F1"   # Background
export FOREGROUND_COLOR="#424242"   # Foreground (Text)

export CURSOR_COLOR="#424242" # Cursor

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
