#!/usr/bin/env bash

export PROFILE_NAME="Vaombe"

export COLOR_01="#111413"           # Black (Host)
export COLOR_02="#8f3232"           # Red (Syntax string)
export COLOR_03="#3b5c3b"           # Green (Command)
export COLOR_04="#7a6322"           # Yellow (Command second)
export COLOR_05="#28405c"           # Blue (Path)
export COLOR_06="#46285c"           # Magenta (Syntax var)
export COLOR_07="#346666"           # Cyan (Prompt)
export COLOR_08="#d1d1d1"           # White

export COLOR_09="#212927"           # Bright Black
export COLOR_10="#b84242"           # Bright Red (Command error)
export COLOR_11="#57a355"           # Bright Green (Exec)
export COLOR_12="#dbbb60"           # Bright Yellow
export COLOR_13="#5183b8"           # Bright Blue (Folder)
export COLOR_14="#935fb8"           # Bright Magenta
export COLOR_15="#51b8b0"           # Bright Cyan
export COLOR_16="#f5fffd"           # Bright White

export BACKGROUND_COLOR="#010a08"   # Background
export FOREGROUND_COLOR="#f5fffd"   # Foreground (Text)

export CURSOR_COLOR="#9df5e2" # Cursor

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
