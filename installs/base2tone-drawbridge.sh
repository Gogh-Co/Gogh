#!/usr/bin/env bash

export PROFILE_NAME="Base2Tone Drawbridge"

export COLOR_01="#1B1F32"           # Black (Host)
export COLOR_02="#627AF4"           # Red (Syntax string)
export COLOR_03="#67C9E4"           # Green (Command)
export COLOR_04="#99E9FF"           # Yellow (Command second)
export COLOR_05="#7289FD"           # Blue (Path)
export COLOR_06="#67C9E4"           # Magenta (Syntax var)
export COLOR_07="#8B9EFD"           # Cyan (Prompt)
export COLOR_08="#9094A7"           # White

export COLOR_09="#51587B"           # Bright Black
export COLOR_10="#75D5F0"           # Bright Red (Command error)
export COLOR_11="#252A41"           # Bright Green (Exec)
export COLOR_12="#444B6F"           # Bright Yellow
export COLOR_13="#5E6587"           # Bright Blue (Folder)
export COLOR_14="#C3CDFE"           # Bright Magenta
export COLOR_15="#5CBCD6"           # Bright Cyan
export COLOR_16="#E1E6FF"           # Bright White

export BACKGROUND_COLOR="#1B1F32"   # Background
export FOREGROUND_COLOR="#9094A7"   # Foreground (Text)

export CURSOR_COLOR="#289DBD" # Cursor

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
