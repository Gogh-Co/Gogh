#!/usr/bin/env bash

export PROFILE_NAME="Fideloper"

export COLOR_01="#292F33"           # Black (Host)
export COLOR_02="#CB1E2D"           # Red (Syntax string)
export COLOR_03="#EDB8AC"           # Green (Command)
export COLOR_04="#B7AB9B"           # Yellow (Command second)
export COLOR_05="#2E78C2"           # Blue (Path)
export COLOR_06="#C0236F"           # Magenta (Syntax var)
export COLOR_07="#309186"           # Cyan (Prompt)
export COLOR_08="#EAE3CE"           # White

export COLOR_09="#092028"           # Bright Black
export COLOR_10="#D4605A"           # Bright Red (Command error)
export COLOR_11="#D4605A"           # Bright Green (Exec)
export COLOR_12="#A86671"           # Bright Yellow
export COLOR_13="#7C85C4"           # Bright Blue (Folder)
export COLOR_14="#5C5DB2"           # Bright Magenta
export COLOR_15="#819090"           # Bright Cyan
export COLOR_16="#FCF4DF"           # Bright White

export BACKGROUND_COLOR="#292F33"   # Background
export FOREGROUND_COLOR="#DBDAE0"   # Foreground (Text)

export CURSOR_COLOR="#D4605A" # Cursor

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
