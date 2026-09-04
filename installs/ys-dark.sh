#!/usr/bin/env bash

export PROFILE_NAME="Ys Dark"

export COLOR_01="#101010"           # Black (Host)
export COLOR_02="#F07178"           # Red (Syntax string)
export COLOR_03="#C3E88D"           # Green (Command)
export COLOR_04="#FFCB6B"           # Yellow (Command second)
export COLOR_05="#82AAFF"           # Blue (Path)
export COLOR_06="#E1ACFF"           # Magenta (Syntax var)
export COLOR_07="#89DDFF"           # Cyan (Prompt)
export COLOR_08="#D0D0D0"           # White

export COLOR_09="#434758"           # Bright Black
export COLOR_10="#FF8B92"           # Bright Red (Command error)
export COLOR_11="#DDFFA7"           # Bright Green (Exec)
export COLOR_12="#FFE585"           # Bright Yellow
export COLOR_13="#9CC4FF"           # Bright Blue (Folder)
export COLOR_14="#C792EA"           # Bright Magenta
export COLOR_15="#A3F7FF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#1B1E35"   # Background
export FOREGROUND_COLOR="#BBC5FF"   # Foreground (Text)

export CURSOR_COLOR="#BBC5FF" # Cursor

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
