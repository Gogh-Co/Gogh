#!/usr/bin/env bash

export PROFILE_NAME="Pale Night Hc"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#F07178"           # Red (Syntax string)
export COLOR_03="#C3E88D"           # Green (Command)
export COLOR_04="#FFCB6B"           # Yellow (Command second)
export COLOR_05="#82AAFF"           # Blue (Path)
export COLOR_06="#C792EA"           # Magenta (Syntax var)
export COLOR_07="#89DDFF"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#666666"           # Bright Black
export COLOR_10="#F6A9AE"           # Bright Red (Command error)
export COLOR_11="#DBF1BA"           # Bright Green (Exec)
export COLOR_12="#FFDFA6"           # Bright Yellow
export COLOR_13="#B4CCFF"           # Bright Blue (Folder)
export COLOR_14="#DDBDF2"           # Bright Magenta
export COLOR_15="#B8EAFF"           # Bright Cyan
export COLOR_16="#999999"           # Bright White

export BACKGROUND_COLOR="#3E4251"   # Background
export FOREGROUND_COLOR="#CCCCCC"   # Foreground (Text)

export CURSOR_COLOR="#FFCB6B" # Cursor

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
