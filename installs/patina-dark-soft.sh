#!/usr/bin/env bash

export PROFILE_NAME="Patina Dark Soft"

export COLOR_01="#2E2E2E"           # Black (Host)
export COLOR_02="#CB7676"           # Red (Syntax string)
export COLOR_03="#549C7D"           # Green (Command)
export COLOR_04="#E6CC77"           # Yellow (Command second)
export COLOR_05="#6DB3C2"           # Blue (Path)
export COLOR_06="#C98A7D"           # Magenta (Syntax var)
export COLOR_07="#5DA9A7"           # Cyan (Prompt)
export COLOR_08="#DBD7CA"           # White

export COLOR_09="#585858"           # Bright Black
export COLOR_10="#CB7676"           # Bright Red (Command error)
export COLOR_11="#549C7D"           # Bright Green (Exec)
export COLOR_12="#E6CC77"           # Bright Yellow
export COLOR_13="#6DB3C2"           # Bright Blue (Folder)
export COLOR_14="#C98A7D"           # Bright Magenta
export COLOR_15="#5DA9A7"           # Bright Cyan
export COLOR_16="#DBD7CA"           # Bright White

export BACKGROUND_COLOR="#1A1A1A"   # Background
export FOREGROUND_COLOR="#DBD7CA"   # Foreground (Text)

export CURSOR_COLOR="#DBD7CA" # Cursor

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
