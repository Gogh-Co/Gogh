#!/usr/bin/env bash

export PROFILE_NAME="Terminal Basic"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#990000"           # Red (Syntax string)
export COLOR_03="#00a600"           # Green (Command)
export COLOR_04="#999900"           # Yellow (Command second)
export COLOR_05="#0000b2"           # Blue (Path)
export COLOR_06="#b200b2"           # Magenta (Syntax var)
export COLOR_07="#00a6b2"           # Cyan (Prompt)
export COLOR_08="#bfbfbf"           # White

export COLOR_09="#666666"           # Bright Black
export COLOR_10="#e50000"           # Bright Red (Command error)
export COLOR_11="#00d900"           # Bright Green (Exec)
export COLOR_12="#e5e500"           # Bright Yellow
export COLOR_13="#0000ff"           # Bright Blue (Folder)
export COLOR_14="#e500e5"           # Bright Magenta
export COLOR_15="#00e5e5"           # Bright Cyan
export COLOR_16="#e5e5e5"           # Bright White

export BACKGROUND_COLOR="#ffffff"   # Background
export FOREGROUND_COLOR="#000000"   # Foreground (Text)

export CURSOR_COLOR="#7f7f7f" # Cursor

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
