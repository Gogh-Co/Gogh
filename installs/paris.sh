#!/usr/bin/env bash

export PROFILE_NAME="Paris"

export COLOR_01="#1A0A30"           # Black (Host)
export COLOR_02="#FC618D"           # Red (Syntax string)
export COLOR_03="#7BD88F"           # Green (Command)
export COLOR_04="#FCE566"           # Yellow (Command second)
export COLOR_05="#A3F3FF"           # Blue (Path)
export COLOR_06="#C4BDFF"           # Magenta (Syntax var)
export COLOR_07="#A3F3FF"           # Cyan (Prompt)
export COLOR_08="#1A0A30"           # White

export COLOR_09="#C4BDFF"           # Bright Black
export COLOR_10="#FC618D"           # Bright Red (Command error)
export COLOR_11="#7BD88F"           # Bright Green (Exec)
export COLOR_12="#FCE566"           # Bright Yellow
export COLOR_13="#A3F3FF"           # Bright Blue (Folder)
export COLOR_14="#C4BDFF"           # Bright Magenta
export COLOR_15="#A3F3FF"           # Bright Cyan
export COLOR_16="#F7F1FF"           # Bright White

export BACKGROUND_COLOR="#1A0A30"   # Background
export FOREGROUND_COLOR="#F7F1FF"   # Foreground (Text)

export CURSOR_COLOR="#F7F1FF" # Cursor

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
