#!/usr/bin/env bash

export PROFILE_NAME="Monoindustrial"

export COLOR_01="#151C19"           # Black (Host)
export COLOR_02="#A39E64"           # Red (Syntax string)
export COLOR_03="#A8B3AB"           # Green (Command)
export COLOR_04="#E98800"           # Yellow (Command second)
export COLOR_05="#648BD2"           # Blue (Path)
export COLOR_06="#588E60"           # Magenta (Syntax var)
export COLOR_07="#C23800"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#151C19"           # Bright Black
export COLOR_10="#A39E64"           # Bright Red (Command error)
export COLOR_11="#A8B3AB"           # Bright Green (Exec)
export COLOR_12="#C87500"           # Bright Yellow
export COLOR_13="#5879B7"           # Bright Blue (Folder)
export COLOR_14="#588E60"           # Bright Magenta
export COLOR_15="#990000"           # Bright Cyan
export COLOR_16="#EEEEEE"           # Bright White

export BACKGROUND_COLOR="#222C28"   # Background
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
