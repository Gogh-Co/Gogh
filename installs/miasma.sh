#!/usr/bin/env bash

export PROFILE_NAME="Miasma"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#685742"           # Red (Syntax string)
export COLOR_03="#5F875F"           # Green (Command)
export COLOR_04="#B36D43"           # Yellow (Command second)
export COLOR_05="#78824B"           # Blue (Path)
export COLOR_06="#BB7744"           # Magenta (Syntax var)
export COLOR_07="#C9A554"           # Cyan (Prompt)
export COLOR_08="#D7C483"           # White

export COLOR_09="#666666"           # Bright Black
export COLOR_10="#685742"           # Bright Red (Command error)
export COLOR_11="#5F875F"           # Bright Green (Exec)
export COLOR_12="#B36D43"           # Bright Yellow
export COLOR_13="#78824B"           # Bright Blue (Folder)
export COLOR_14="#BB7744"           # Bright Magenta
export COLOR_15="#C9A554"           # Bright Cyan
export COLOR_16="#D7C483"           # Bright White

export BACKGROUND_COLOR="#222222"   # Background
export FOREGROUND_COLOR="#C2C2B0"   # Foreground (Text)

export CURSOR_COLOR="#C7C7C7" # Cursor

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
