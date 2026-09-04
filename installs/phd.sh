#!/usr/bin/env bash

export PROFILE_NAME="Phd"

export COLOR_01="#061229"           # Black (Host)
export COLOR_02="#D07346"           # Red (Syntax string)
export COLOR_03="#99BF52"           # Green (Command)
export COLOR_04="#FBD461"           # Yellow (Command second)
export COLOR_05="#5299BF"           # Blue (Path)
export COLOR_06="#9989CC"           # Magenta (Syntax var)
export COLOR_07="#72B9BF"           # Cyan (Prompt)
export COLOR_08="#B8BBC2"           # White

export COLOR_09="#717885"           # Bright Black
export COLOR_10="#D07346"           # Bright Red (Command error)
export COLOR_11="#99BF52"           # Bright Green (Exec)
export COLOR_12="#FBD461"           # Bright Yellow
export COLOR_13="#5299BF"           # Bright Blue (Folder)
export COLOR_14="#9989CC"           # Bright Magenta
export COLOR_15="#72B9BF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#061229"   # Background
export FOREGROUND_COLOR="#B8BBC2"   # Foreground (Text)

export CURSOR_COLOR="#B8BBC2" # Cursor

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
