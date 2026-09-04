#!/usr/bin/env bash

export PROFILE_NAME="Lichen Chartreuse Light"

export COLOR_01="#F5F7F2"           # Black (Host)
export COLOR_02="#A34740"           # Red (Syntax string)
export COLOR_03="#2F7462"           # Green (Command)
export COLOR_04="#506B29"           # Yellow (Command second)
export COLOR_05="#356E8A"           # Blue (Path)
export COLOR_06="#6E5689"           # Magenta (Syntax var)
export COLOR_07="#356569"           # Cyan (Prompt)
export COLOR_08="#2D302B"           # White

export COLOR_09="#687161"           # Bright Black
export COLOR_10="#A34740"           # Bright Red (Command error)
export COLOR_11="#506B29"           # Bright Green (Exec)
export COLOR_12="#875E20"           # Bright Yellow
export COLOR_13="#3B6D86"           # Bright Blue (Folder)
export COLOR_14="#8A4F67"           # Bright Magenta
export COLOR_15="#3F6464"           # Bright Cyan
export COLOR_16="#151613"           # Bright White

export BACKGROUND_COLOR="#F5F7F2"   # Background
export FOREGROUND_COLOR="#2D302B"   # Foreground (Text)

export CURSOR_COLOR="#2D302B" # Cursor

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
