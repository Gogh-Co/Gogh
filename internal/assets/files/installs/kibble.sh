#!/usr/bin/env bash

export PROFILE_NAME="Kibble"

export COLOR_01="#4D4D4D"           # Black (Host)
export COLOR_02="#C70031"           # Red (Syntax string)
export COLOR_03="#29CF13"           # Green (Command)
export COLOR_04="#D8E30E"           # Yellow (Command second)
export COLOR_05="#3449D1"           # Blue (Path)
export COLOR_06="#8400FF"           # Magenta (Syntax var)
export COLOR_07="#0798AB"           # Cyan (Prompt)
export COLOR_08="#E2D1E3"           # White

export COLOR_09="#5A5A5A"           # Bright Black
export COLOR_10="#F01578"           # Bright Red (Command error)
export COLOR_11="#6CE05C"           # Bright Green (Exec)
export COLOR_12="#F3F79E"           # Bright Yellow
export COLOR_13="#97A4F7"           # Bright Blue (Folder)
export COLOR_14="#C495F0"           # Bright Magenta
export COLOR_15="#68F2E0"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#0E100A"   # Background
export FOREGROUND_COLOR="#F7F7F7"   # Foreground (Text)

export CURSOR_COLOR="#F7F7F7" # Cursor

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
