#!/usr/bin/env bash

export PROFILE_NAME="Candy"

export COLOR_01="#2E3436"           # Black (Host)
export COLOR_02="#FA2573"           # Red (Syntax string)
export COLOR_03="#A6E32D"           # Green (Command)
export COLOR_04="#FC951E"           # Yellow (Command second)
export COLOR_05="#C48DFF"           # Blue (Path)
export COLOR_06="#FA2573"           # Magenta (Syntax var)
export COLOR_07="#67D9F0"           # Cyan (Prompt)
export COLOR_08="#F2F2F2"           # White

export COLOR_09="#555753"           # Bright Black
export COLOR_10="#FA2573"           # Bright Red (Command error)
export COLOR_11="#8AE234"           # Bright Green (Exec)
export COLOR_12="#FCE94F"           # Bright Yellow
export COLOR_13="#729FCF"           # Bright Blue (Folder)
export COLOR_14="#FA2573"           # Bright Magenta
export COLOR_15="#34E2E2"           # Bright Cyan
export COLOR_16="#EEEEEC"           # Bright White

export BACKGROUND_COLOR="#000000"   # Background
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
