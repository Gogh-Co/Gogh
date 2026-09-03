#!/usr/bin/env bash

export PROFILE_NAME="Cobalt Next Dark"

export COLOR_01="#282F36"           # Black (Host)
export COLOR_02="#E6576A"           # Red (Syntax string)
export COLOR_03="#99C794"           # Green (Command)
export COLOR_04="#FAC863"           # Yellow (Command second)
export COLOR_05="#5A9BCF"           # Blue (Path)
export COLOR_06="#C5A5C5"           # Magenta (Syntax var)
export COLOR_07="#5FB3B3"           # Cyan (Prompt)
export COLOR_08="#D8DEE9"           # White

export COLOR_09="#65737E"           # Bright Black
export COLOR_10="#D6838C"           # Bright Red (Command error)
export COLOR_11="#C1DCBE"           # Bright Green (Exec)
export COLOR_12="#FFDE9B"           # Bright Yellow
export COLOR_13="#8ABEE7"           # Bright Blue (Folder)
export COLOR_14="#EDCDED"           # Bright Magenta
export COLOR_15="#9BE2E2"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#0F1C23"   # Background
export FOREGROUND_COLOR="#D8DEE9"   # Foreground (Text)

export CURSOR_COLOR="#FAC863" # Cursor

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
