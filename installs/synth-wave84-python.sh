#!/usr/bin/env bash

export PROFILE_NAME="Synth Wave84 Python"

export COLOR_01="#2A2139"           # Black (Host)
export COLOR_02="#FF2331"           # Red (Syntax string)
export COLOR_03="#37F39E"           # Green (Command)
export COLOR_04="#FFD83D"           # Yellow (Command second)
export COLOR_05="#03EDF9"           # Blue (Path)
export COLOR_06="#B30065"           # Magenta (Syntax var)
export COLOR_07="#03EDF9"           # Cyan (Prompt)
export COLOR_08="#DDDDDD"           # White

export COLOR_09="#444251"           # Bright Black
export COLOR_10="#FE4450"           # Bright Red (Command error)
export COLOR_11="#72F1B8"           # Bright Green (Exec)
export COLOR_12="#FEDE5D"           # Bright Yellow
export COLOR_13="#03EDF9"           # Bright Blue (Folder)
export COLOR_14="#D40078"           # Bright Magenta
export COLOR_15="#03EDF9"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#100A24"   # Background
export FOREGROUND_COLOR="#FFADE8"   # Foreground (Text)

export CURSOR_COLOR="#FFADE8" # Cursor

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
