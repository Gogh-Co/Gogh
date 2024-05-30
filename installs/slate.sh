#!/usr/bin/env bash

export PROFILE_NAME="Slate"

export COLOR_01="#222222"           # Black (Host)
export COLOR_02="#E2A8BF"           # Red (Syntax string)
export COLOR_03="#81D778"           # Green (Command)
export COLOR_04="#C4C9C0"           # Yellow (Command second)
export COLOR_05="#264B49"           # Blue (Path)
export COLOR_06="#A481D3"           # Magenta (Syntax var)
export COLOR_07="#15AB9C"           # Cyan (Prompt)
export COLOR_08="#02C5E0"           # White

export COLOR_09="#FFFFFF"           # Bright Black
export COLOR_10="#FFCDD9"           # Bright Red (Command error)
export COLOR_11="#BEFFA8"           # Bright Green (Exec)
export COLOR_12="#D0CCCA"           # Bright Yellow
export COLOR_13="#7AB0D2"           # Bright Blue (Folder)
export COLOR_14="#C5A7D9"           # Bright Magenta
export COLOR_15="#8CDFE0"           # Bright Cyan
export COLOR_16="#E0E0E0"           # Bright White

export BACKGROUND_COLOR="#222222"   # Background
export FOREGROUND_COLOR="#35B1D2"   # Foreground (Text)

export CURSOR_COLOR="#35B1D2" # Cursor

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
