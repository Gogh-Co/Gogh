#!/usr/bin/env bash

export PROFILE_NAME="Aperture Science"

export COLOR_01="#A66900"           # Black (Host)
export COLOR_02="#A66900"           # Red (Syntax string)
export COLOR_03="#A66900"           # Green (Command)
export COLOR_04="#A66900"           # Yellow (Command second)
export COLOR_05="#A66900"           # Blue (Path)
export COLOR_06="#A66900"           # Magenta (Syntax var)
export COLOR_07="#A66900"           # Cyan (Prompt)
export COLOR_08="#A66900"           # White

export COLOR_09="#A66900"           # Bright Black
export COLOR_10="#A66900"           # Bright Red (Command error)
export COLOR_11="#A66900"           # Bright Green (Exec)
export COLOR_12="#A66900"           # Bright Yellow
export COLOR_13="#A66900"           # Bright Blue (Folder)
export COLOR_14="#A66900"           # Bright Magenta
export COLOR_15="#A66900"           # Bright Cyan
export COLOR_16="#A66900"           # Bright White

export BACKGROUND_COLOR="#6F3D00"   # Background
export FOREGROUND_COLOR="#A66900"   # Foreground (Text)

export CURSOR_COLOR="#A66900" # Cursor

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
