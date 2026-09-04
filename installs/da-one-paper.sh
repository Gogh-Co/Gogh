#!/usr/bin/env bash

export PROFILE_NAME="Da One Paper"

export COLOR_01="#FAF0DC"           # Black (Host)
export COLOR_02="#DE5D6E"           # Red (Syntax string)
export COLOR_03="#76A85D"           # Green (Command)
export COLOR_04="#B3684F"           # Yellow (Command second)
export COLOR_05="#5890F8"           # Blue (Path)
export COLOR_06="#C173D1"           # Magenta (Syntax var)
export COLOR_07="#64B5A7"           # Cyan (Prompt)
export COLOR_08="#181818"           # White

export COLOR_09="#585858"           # Bright Black
export COLOR_10="#DE5D6E"           # Bright Red (Command error)
export COLOR_11="#76A85D"           # Bright Green (Exec)
export COLOR_12="#B3684F"           # Bright Yellow
export COLOR_13="#5890F8"           # Bright Blue (Folder)
export COLOR_14="#C173D1"           # Bright Magenta
export COLOR_15="#64B5A7"           # Bright Cyan
export COLOR_16="#000000"           # Bright White

export BACKGROUND_COLOR="#FAF0DC"   # Background
export FOREGROUND_COLOR="#181818"   # Foreground (Text)

export CURSOR_COLOR="#181818" # Cursor

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
