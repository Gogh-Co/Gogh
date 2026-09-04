#!/usr/bin/env bash

export PROFILE_NAME="Dainty Dark"

export COLOR_01="#214969"           # Black (Host)
export COLOR_02="#E52E2E"           # Red (Syntax string)
export COLOR_03="#44FFB1"           # Green (Command)
export COLOR_04="#FFE073"           # Yellow (Command second)
export COLOR_05="#0FC5ED"           # Blue (Path)
export COLOR_06="#A277FF"           # Magenta (Syntax var)
export COLOR_07="#24EAF7"           # Cyan (Prompt)
export COLOR_08="#24EAF7"           # White

export COLOR_09="#214969"           # Bright Black
export COLOR_10="#E52E2E"           # Bright Red (Command error)
export COLOR_11="#44FFB1"           # Bright Green (Exec)
export COLOR_12="#FFE073"           # Bright Yellow
export COLOR_13="#A277FF"           # Bright Blue (Folder)
export COLOR_14="#A277FF"           # Bright Magenta
export COLOR_15="#24EAF7"           # Bright Cyan
export COLOR_16="#24EAF7"           # Bright White

export BACKGROUND_COLOR="#011423"   # Background
export FOREGROUND_COLOR="#CBE0F0"   # Foreground (Text)

export CURSOR_COLOR="#CBE0F0" # Cursor

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
