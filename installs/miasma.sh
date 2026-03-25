#!/usr/bin/env bash

export PROFILE_NAME="Miasma"

export COLOR_01="#222222"           # Black (Host)
export COLOR_02="#685742"           # Red (Syntax string)
export COLOR_03="#5f875f"           # Green (Command)
export COLOR_04="#b36d43"           # Yellow (Command second)
export COLOR_05="#78824b"           # Blue (Path)
export COLOR_06="#bb7744"           # Magenta (Syntax var)
export COLOR_07="#c9a554"           # Cyan (Prompt)
export COLOR_08="#d7c483"           # White

export COLOR_09="#666666"           # Bright Black
export COLOR_10="#685742"           # Bright Red (Command error)
export COLOR_11="#5f875f"           # Bright Green (Exec)
export COLOR_12="#b36d43"           # Bright Yellow
export COLOR_13="#78824b"           # Bright Blue (Folder)
export COLOR_14="#bb7744"           # Bright Magenta
export COLOR_15="#c9a554"           # Bright Cyan
export COLOR_16="#d7c483"           # Bright White

export BACKGROUND_COLOR="#222222"   # Background
export FOREGROUND_COLOR="#c2c2b0"   # Foreground (Text)

export CURSOR_COLOR="#c2c2b0" # Cursor

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
