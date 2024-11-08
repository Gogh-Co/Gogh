#!/usr/bin/env bash

export PROFILE_NAME="Tempus Spring"

export COLOR_01="#283a37"           # Black (Host)
export COLOR_02="#ff8b5f"           # Red (Syntax string)
export COLOR_03="#5ec04d"           # Green (Command)
export COLOR_04="#b0b01a"           # Yellow (Command second)
export COLOR_05="#39bace"           # Blue (Path)
export COLOR_06="#e99399"           # Magenta (Syntax var)
export COLOR_07="#36c08e"           # Cyan (Prompt)
export COLOR_08="#99afae"           # White

export COLOR_09="#2a453d"           # Bright Black
export COLOR_10="#e19e00"           # Bright Red (Command error)
export COLOR_11="#73be0d"           # Bright Green (Exec)
export COLOR_12="#c6a843"           # Bright Yellow
export COLOR_13="#70afef"           # Bright Blue (Folder)
export COLOR_14="#d095e2"           # Bright Magenta
export COLOR_15="#3cbfaf"           # Bright Cyan
export COLOR_16="#b5b8b7"           # Bright White

export BACKGROUND_COLOR="#283a37"   # Background
export FOREGROUND_COLOR="#b5b8b7"   # Foreground (Text)

export CURSOR_COLOR="#b5b8b7" # Cursor

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
