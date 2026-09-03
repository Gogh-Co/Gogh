#!/usr/bin/env bash

export PROFILE_NAME="Aurora"

export COLOR_01="#23262E"           # Black (Host)
export COLOR_02="#F0266F"           # Red (Syntax string)
export COLOR_03="#8FD46D"           # Green (Command)
export COLOR_04="#FFE66D"           # Yellow (Command second)
export COLOR_05="#0321D7"           # Blue (Path)
export COLOR_06="#EE5D43"           # Magenta (Syntax var)
export COLOR_07="#03D6B8"           # Cyan (Prompt)
export COLOR_08="#C74DED"           # White

export COLOR_09="#292E38"           # Bright Black
export COLOR_10="#F92672"           # Bright Red (Command error)
export COLOR_11="#8FD46D"           # Bright Green (Exec)
export COLOR_12="#FFE66D"           # Bright Yellow
export COLOR_13="#03D6B8"           # Bright Blue (Folder)
export COLOR_14="#EE5D43"           # Bright Magenta
export COLOR_15="#03D6B8"           # Bright Cyan
export COLOR_16="#C74DED"           # Bright White

export BACKGROUND_COLOR="#23262E"   # Background
export FOREGROUND_COLOR="#FFCA28"   # Foreground (Text)

export CURSOR_COLOR="#EE5D43" # Cursor

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
