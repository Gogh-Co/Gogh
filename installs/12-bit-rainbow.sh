#!/usr/bin/env bash

export PROFILE_NAME="12-bit Rainbow"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#A03050"           # Red (Syntax string)
export COLOR_03="#40D080"           # Green (Command)
export COLOR_04="#E09040"           # Yellow (Command second)
export COLOR_05="#3060B0"           # Blue (Path)
export COLOR_06="#603090"           # Magenta (Syntax var)
export COLOR_07="#0090C0"           # Cyan (Prompt)
export COLOR_08="#DBDED8"           # White

export COLOR_09="#685656"           # Bright Black
export COLOR_10="#C06060"           # Bright Red (Command error)
export COLOR_11="#90D050"           # Bright Green (Exec)
export COLOR_12="#E0D000"           # Bright Yellow
export COLOR_13="#00B0C0"           # Bright Blue (Folder)
export COLOR_14="#801070"           # Bright Magenta
export COLOR_15="#20B0C0"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#040404"   # Background
export FOREGROUND_COLOR="#FEFFFF"   # Foreground (Text)

export CURSOR_COLOR="#E0D000" # Cursor

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
