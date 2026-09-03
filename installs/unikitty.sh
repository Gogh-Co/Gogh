#!/usr/bin/env bash

export PROFILE_NAME="Unikitty"

export COLOR_01="#0C0C0C"           # Black (Host)
export COLOR_02="#A80F20"           # Red (Syntax string)
export COLOR_03="#BAFC8B"           # Green (Command)
export COLOR_04="#EEDF4B"           # Yellow (Command second)
export COLOR_05="#145FCD"           # Blue (Path)
export COLOR_06="#FF36A2"           # Magenta (Syntax var)
export COLOR_07="#6BD1BC"           # Cyan (Prompt)
export COLOR_08="#E2D7E1"           # White

export COLOR_09="#434343"           # Bright Black
export COLOR_10="#D91329"           # Bright Red (Command error)
export COLOR_11="#D3FFAF"           # Bright Green (Exec)
export COLOR_12="#FFEF50"           # Bright Yellow
export COLOR_13="#0075EA"           # Bright Blue (Folder)
export COLOR_14="#FDD5E5"           # Bright Magenta
export COLOR_15="#79ECD5"           # Bright Cyan
export COLOR_16="#FFF3FE"           # Bright White

export BACKGROUND_COLOR="#FF8CD9"   # Background
export FOREGROUND_COLOR="#0B0B0B"   # Foreground (Text)

export CURSOR_COLOR="#BAFC8B" # Cursor

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
