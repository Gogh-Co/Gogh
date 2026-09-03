#!/usr/bin/env bash

export PROFILE_NAME="HaX0R Gr33N"

export COLOR_01="#001F0B"           # Black (Host)
export COLOR_02="#15D00D"           # Red (Syntax string)
export COLOR_03="#15D00D"           # Green (Command)
export COLOR_04="#15D00D"           # Yellow (Command second)
export COLOR_05="#15D00D"           # Blue (Path)
export COLOR_06="#15D00D"           # Magenta (Syntax var)
export COLOR_07="#15D00D"           # Cyan (Prompt)
export COLOR_08="#FAFAFA"           # White

export COLOR_09="#001510"           # Bright Black
export COLOR_10="#19E20E"           # Bright Red (Command error)
export COLOR_11="#19E20E"           # Bright Green (Exec)
export COLOR_12="#19E20E"           # Bright Yellow
export COLOR_13="#19E20E"           # Bright Blue (Folder)
export COLOR_14="#19E20E"           # Bright Magenta
export COLOR_15="#19E20E"           # Bright Cyan
export COLOR_16="#FEFEFE"           # Bright White

export BACKGROUND_COLOR="#020F01"   # Background
export FOREGROUND_COLOR="#16B10E"   # Foreground (Text)

export CURSOR_COLOR="#15D00D" # Cursor

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
