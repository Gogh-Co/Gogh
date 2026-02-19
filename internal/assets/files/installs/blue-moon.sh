#!/usr/bin/env bash

export PROFILE_NAME="Blue Moon"

export COLOR_01="#353b52"           # Black (Host)
export COLOR_02="#d06178"           # Red (Syntax string)
export COLOR_03="#b4c4b4"           # Green (Command)
export COLOR_04="#cfcfbf"           # Yellow (Command second)
export COLOR_05="#959dcb"           # Blue (Path)
export COLOR_06="#b9a3eb"           # Magenta (Syntax var)
export COLOR_07="#89bbdd"           # Cyan (Prompt)
export COLOR_08="#ffffff"           # White

export COLOR_09="#8796b0"           # Bright Black
export COLOR_10="#e61f44"           # Bright Red (Command error)
export COLOR_11="#acfab4"           # Bright Green (Exec)
export COLOR_12="#dfdf9f"           # Bright Yellow
export COLOR_13="#b8bcf3"           # Bright Blue (Folder)
export COLOR_14="#b9a3eb"           # Bright Magenta
export COLOR_15="#89ddff"           # Bright Cyan
export COLOR_16="#ffffff"           # Bright White

export BACKGROUND_COLOR="#1b1e2b"   # Background
export FOREGROUND_COLOR="#676e96"   # Foreground (Text)

export CURSOR_COLOR="#676e96" # Cursor

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
