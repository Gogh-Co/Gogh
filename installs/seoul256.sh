#!/usr/bin/env bash

export PROFILE_NAME="Seoul256"

export COLOR_01="#4E4E4E"           # Black (Host)
export COLOR_02="#D68787"           # Red (Syntax string)
export COLOR_03="#5F865F"           # Green (Command)
export COLOR_04="#D8AF5F"           # Yellow (Command second)
export COLOR_05="#85ADD4"           # Blue (Path)
export COLOR_06="#D7AFAF"           # Magenta (Syntax var)
export COLOR_07="#87AFAF"           # Cyan (Prompt)
export COLOR_08="#D0D0D0"           # White

export COLOR_09="#626262"           # Bright Black
export COLOR_10="#D75F87"           # Bright Red (Command error)
export COLOR_11="#87AF87"           # Bright Green (Exec)
export COLOR_12="#FFD787"           # Bright Yellow
export COLOR_13="#ADD4FB"           # Bright Blue (Folder)
export COLOR_14="#FFAFAF"           # Bright Magenta
export COLOR_15="#87D7D7"           # Bright Cyan
export COLOR_16="#E4E4E4"           # Bright White

export BACKGROUND_COLOR="#3A3A3A"   # Background
export FOREGROUND_COLOR="#D0D0D0"   # Foreground (Text)

export CURSOR_COLOR="#D0D0D0" # Cursor

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
