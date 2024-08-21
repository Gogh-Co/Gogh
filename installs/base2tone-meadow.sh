#!/usr/bin/env bash

export PROFILE_NAME="Base2Tone Meadow"

export COLOR_01="#192834"           # Black (Host)
export COLOR_02="#277fbe"           # Red (Syntax string)
export COLOR_03="#80bf40"           # Green (Command)
export COLOR_04="#a6f655"           # Yellow (Command second)
export COLOR_05="#4299d7"           # Blue (Path)
export COLOR_06="#80bf40"           # Magenta (Syntax var)
export COLOR_07="#47adf5"           # Cyan (Prompt)
export COLOR_08="#7b9eb7"           # White

export COLOR_09="#3d5e76"           # Bright Black
export COLOR_10="#8cdd3c"           # Bright Red (Command error)
export COLOR_11="#223644"           # Bright Green (Exec)
export COLOR_12="#335166"           # Bright Yellow
export COLOR_13="#466b86"           # Bright Blue (Folder)
export COLOR_14="#afddfe"           # Bright Magenta
export COLOR_15="#73b234"           # Bright Cyan
export COLOR_16="#d1ecff"           # Bright White

export BACKGROUND_COLOR="#192834"   # Background
export FOREGROUND_COLOR="#7b9eb7"   # Foreground (Text)

export CURSOR_COLOR="#4d8217" # Cursor

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
