#!/usr/bin/env bash

export PROFILE_NAME="SeedFlip Carbon"

export COLOR_01="#D4D4D4"           # Black (Host)
export COLOR_02="#993333"           # Red (Syntax string)
export COLOR_03="#339955"           # Green (Command)
export COLOR_04="#998833"           # Yellow (Command second)
export COLOR_05="#335D99"           # Blue (Path)
export COLOR_06="#993399"           # Magenta (Syntax var)
export COLOR_07="#339999"           # Cyan (Prompt)
export COLOR_08="#000000"           # White

export COLOR_09="#AEAEAE"           # Bright Black
export COLOR_10="#C65353"           # Bright Red (Command error)
export COLOR_11="#53C679"           # Bright Green (Exec)
export COLOR_12="#C6B353"           # Bright Yellow
export COLOR_13="#5383C6"           # Bright Blue (Folder)
export COLOR_14="#C653C6"           # Bright Magenta
export COLOR_15="#53C6C6"           # Bright Cyan
export COLOR_16="#000000"           # Bright White

export BACKGROUND_COLOR="#FAFAFA"   # Background
export FOREGROUND_COLOR="#000000"   # Foreground (Text)

export CURSOR_COLOR="#000000" # Cursor

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
