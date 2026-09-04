#!/usr/bin/env bash

export PROFILE_NAME="Onedark Dark"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#EF596F"           # Red (Syntax string)
export COLOR_03="#89CA78"           # Green (Command)
export COLOR_04="#E5C07B"           # Yellow (Command second)
export COLOR_05="#61AFEF"           # Blue (Path)
export COLOR_06="#D55FDE"           # Magenta (Syntax var)
export COLOR_07="#2BBAC5"           # Cyan (Prompt)
export COLOR_08="#ABB2BF"           # White

export COLOR_09="#434852"           # Bright Black
export COLOR_10="#EF596F"           # Bright Red (Command error)
export COLOR_11="#89CA78"           # Bright Green (Exec)
export COLOR_12="#E5C07B"           # Bright Yellow
export COLOR_13="#61AFEF"           # Bright Blue (Folder)
export COLOR_14="#D55FDE"           # Bright Magenta
export COLOR_15="#2BBAC5"           # Bright Cyan
export COLOR_16="#C8CCD4"           # Bright White

export BACKGROUND_COLOR="#000000"   # Background
export FOREGROUND_COLOR="#ABB2BF"   # Foreground (Text)

export CURSOR_COLOR="#ABB2BF" # Cursor

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
