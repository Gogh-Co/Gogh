#!/usr/bin/env bash

export PROFILE_NAME="Tempus Dawn"

export COLOR_01="#4a4b4e"           # Black (Host)
export COLOR_02="#a32a3a"           # Red (Syntax string)
export COLOR_03="#206620"           # Green (Command)
export COLOR_04="#745300"           # Yellow (Command second)
export COLOR_05="#4b529a"           # Blue (Path)
export COLOR_06="#8d377e"           # Magenta (Syntax var)
export COLOR_07="#086784"           # Cyan (Prompt)
export COLOR_08="#dee2e0"           # White

export COLOR_09="#676364"           # Bright Black
export COLOR_10="#a64822"           # Bright Red (Command error)
export COLOR_11="#187408"           # Bright Green (Exec)
export COLOR_12="#8b590a"           # Bright Yellow
export COLOR_13="#5c59b2"           # Bright Blue (Folder)
export COLOR_14="#8e45a8"           # Bright Magenta
export COLOR_15="#3f649c"           # Bright Cyan
export COLOR_16="#eff0f2"           # Bright White

export BACKGROUND_COLOR="#eff0f2"   # Background
export FOREGROUND_COLOR="#4a4b4e"   # Foreground (Text)

export CURSOR_COLOR="#4a4b4e" # Cursor

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
