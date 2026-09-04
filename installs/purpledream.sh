#!/usr/bin/env bash

export PROFILE_NAME="Purpledream"

export COLOR_01="#100510"           # Black (Host)
export COLOR_02="#FF1D0D"           # Red (Syntax string)
export COLOR_03="#14CC64"           # Green (Command)
export COLOR_04="#F000A0"           # Yellow (Command second)
export COLOR_05="#00A0F0"           # Blue (Path)
export COLOR_06="#B000D0"           # Magenta (Syntax var)
export COLOR_07="#0075B0"           # Cyan (Prompt)
export COLOR_08="#DDD0DD"           # White

export COLOR_09="#605060"           # Bright Black
export COLOR_10="#FF1D0D"           # Bright Red (Command error)
export COLOR_11="#14CC64"           # Bright Green (Exec)
export COLOR_12="#F000A0"           # Bright Yellow
export COLOR_13="#00A0F0"           # Bright Blue (Folder)
export COLOR_14="#B000D0"           # Bright Magenta
export COLOR_15="#0075B0"           # Bright Cyan
export COLOR_16="#FFF0FF"           # Bright White

export BACKGROUND_COLOR="#100510"   # Background
export FOREGROUND_COLOR="#DDD0DD"   # Foreground (Text)

export CURSOR_COLOR="#DDD0DD" # Cursor

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
