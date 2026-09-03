#!/usr/bin/env bash

export PROFILE_NAME="Cyberpunk"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#FF7092"           # Red (Syntax string)
export COLOR_03="#00FBAC"           # Green (Command)
export COLOR_04="#FFFA6A"           # Yellow (Command second)
export COLOR_05="#00BFFF"           # Blue (Path)
export COLOR_06="#DF95FF"           # Magenta (Syntax var)
export COLOR_07="#86CBFE"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#000000"           # Bright Black
export COLOR_10="#FF8AA4"           # Bright Red (Command error)
export COLOR_11="#21F6BC"           # Bright Green (Exec)
export COLOR_12="#FFF787"           # Bright Yellow
export COLOR_13="#1BCCFD"           # Bright Blue (Folder)
export COLOR_14="#E6AEFE"           # Bright Magenta
export COLOR_15="#99D6FC"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#332A57"   # Background
export FOREGROUND_COLOR="#E5E5E5"   # Foreground (Text)

export CURSOR_COLOR="#21F6BC" # Cursor

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
