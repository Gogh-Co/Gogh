#!/usr/bin/env bash

export PROFILE_NAME="Aztec"

export COLOR_01="#101600"           # Black (Host)
export COLOR_02="#EE2E00"           # Red (Syntax string)
export COLOR_03="#63D932"           # Green (Command)
export COLOR_04="#EEBB00"           # Yellow (Command second)
export COLOR_05="#5B4A9F"           # Blue (Path)
export COLOR_06="#883E9F"           # Magenta (Syntax var)
export COLOR_07="#3D94A5"           # Cyan (Prompt)
export COLOR_08="#FFDA51"           # White

export COLOR_09="#2E2E05"           # Bright Black
export COLOR_10="#EE2E00"           # Bright Red (Command error)
export COLOR_11="#63D932"           # Bright Green (Exec)
export COLOR_12="#EEBB00"           # Bright Yellow
export COLOR_13="#5B4A9F"           # Bright Blue (Folder)
export COLOR_14="#883E9F"           # Bright Magenta
export COLOR_15="#3D94A5"           # Bright Cyan
export COLOR_16="#FFEBA0"           # Bright White

export BACKGROUND_COLOR="#101600"   # Background
export FOREGROUND_COLOR="#FFDA51"   # Foreground (Text)

export CURSOR_COLOR="#FFDA51" # Cursor

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
