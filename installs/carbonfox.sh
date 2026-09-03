#!/usr/bin/env bash

export PROFILE_NAME="Carbonfox"

export COLOR_01="#282828"           # Black (Host)
export COLOR_02="#EE5396"           # Red (Syntax string)
export COLOR_03="#25BE6A"           # Green (Command)
export COLOR_04="#08BDBA"           # Yellow (Command second)
export COLOR_05="#78A9FF"           # Blue (Path)
export COLOR_06="#BE95FF"           # Magenta (Syntax var)
export COLOR_07="#33B1FF"           # Cyan (Prompt)
export COLOR_08="#DFDFE0"           # White

export COLOR_09="#484848"           # Bright Black
export COLOR_10="#F16DA6"           # Bright Red (Command error)
export COLOR_11="#46C880"           # Bright Green (Exec)
export COLOR_12="#2DC7C4"           # Bright Yellow
export COLOR_13="#8CB6FF"           # Bright Blue (Folder)
export COLOR_14="#C8A5FF"           # Bright Magenta
export COLOR_15="#52BDFF"           # Bright Cyan
export COLOR_16="#E4E4E5"           # Bright White

export BACKGROUND_COLOR="#161616"   # Background
export FOREGROUND_COLOR="#F2F4F8"   # Foreground (Text)

export CURSOR_COLOR="#F2F4F8" # Cursor

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
