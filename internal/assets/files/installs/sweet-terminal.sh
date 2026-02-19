#!/usr/bin/env bash

export PROFILE_NAME="Sweet Terminal"

export COLOR_01="#3F3F54"           # Black (Host)
export COLOR_02="#F60055"           # Red (Syntax string)
export COLOR_03="#06C993"           # Green (Command)
export COLOR_04="#9700BE"           # Yellow (Command second)
export COLOR_05="#F69154"           # Blue (Path)
export COLOR_06="#EC89CB"           # Magenta (Syntax var)
export COLOR_07="#60ADEC"           # Cyan (Prompt)
export COLOR_08="#ABB2BF"           # White

export COLOR_09="#959DCB"           # Bright Black
export COLOR_10="#F60055"           # Bright Red (Command error)
export COLOR_11="#06C993"           # Bright Green (Exec)
export COLOR_12="#9700BE"           # Bright Yellow
export COLOR_13="#F69154"           # Bright Blue (Folder)
export COLOR_14="#EC89CB"           # Bright Magenta
export COLOR_15="#00DDED"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#222235"   # Background
export FOREGROUND_COLOR="#FFFFFF"   # Foreground (Text)

export CURSOR_COLOR="#FFFFFF" # Cursor

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
