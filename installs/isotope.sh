#!/usr/bin/env bash

export PROFILE_NAME="Isotope"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#FF0000"           # Red (Syntax string)
export COLOR_03="#33FF00"           # Green (Command)
export COLOR_04="#FF0099"           # Yellow (Command second)
export COLOR_05="#0066FF"           # Blue (Path)
export COLOR_06="#CC00FF"           # Magenta (Syntax var)
export COLOR_07="#00FFFF"           # Cyan (Prompt)
export COLOR_08="#D0D0D0"           # White

export COLOR_09="#808080"           # Bright Black
export COLOR_10="#FF0000"           # Bright Red (Command error)
export COLOR_11="#33FF00"           # Bright Green (Exec)
export COLOR_12="#FF0099"           # Bright Yellow
export COLOR_13="#0066FF"           # Bright Blue (Folder)
export COLOR_14="#CC00FF"           # Bright Magenta
export COLOR_15="#00FFFF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#000000"   # Background
export FOREGROUND_COLOR="#D0D0D0"   # Foreground (Text)

export CURSOR_COLOR="#D0D0D0" # Cursor

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
