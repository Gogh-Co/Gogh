#!/usr/bin/env bash

export PROFILE_NAME="Bloody"

export COLOR_01="#2E3436"           # Black (Host)
export COLOR_02="#FF512F"           # Red (Syntax string)
export COLOR_03="#B2FFA9"           # Green (Command)
export COLOR_04="#FFFD82"           # Yellow (Command second)
export COLOR_05="#3185FC"           # Blue (Path)
export COLOR_06="#DD2476"           # Magenta (Syntax var)
export COLOR_07="#66D7D1"           # Cyan (Prompt)
export COLOR_08="#F2EFEA"           # White

export COLOR_09="#555753"           # Bright Black
export COLOR_10="#FF512F"           # Bright Red (Command error)
export COLOR_11="#B2FFA9"           # Bright Green (Exec)
export COLOR_12="#FFFD82"           # Bright Yellow
export COLOR_13="#3185FC"           # Bright Blue (Folder)
export COLOR_14="#DD2476"           # Bright Magenta
export COLOR_15="#66D7D1"           # Bright Cyan
export COLOR_16="#F2EFEA"           # Bright White

export BACKGROUND_COLOR="#1E1F29"   # Background
export FOREGROUND_COLOR="#AAAAAA"   # Foreground (Text)

export CURSOR_COLOR="#AAAAAA" # Cursor

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
