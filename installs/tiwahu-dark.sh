#!/usr/bin/env bash

export PROFILE_NAME="Tiwahu Dark"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#CC0000"           # Red (Syntax string)
export COLOR_03="#00CC00"           # Green (Command)
export COLOR_04="#CC8800"           # Yellow (Command second)
export COLOR_05="#0088CC"           # Blue (Path)
export COLOR_06="#CC00CC"           # Magenta (Syntax var)
export COLOR_07="#00CCCC"           # Cyan (Prompt)
export COLOR_08="#CCCCCC"           # White

export COLOR_09="#888888"           # Bright Black
export COLOR_10="#FF8888"           # Bright Red (Command error)
export COLOR_11="#88FF88"           # Bright Green (Exec)
export COLOR_12="#FFFF00"           # Bright Yellow
export COLOR_13="#88CCFF"           # Bright Blue (Folder)
export COLOR_14="#FF88FF"           # Bright Magenta
export COLOR_15="#88FFFF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#181818"   # Background
export FOREGROUND_COLOR="#AAAAAA"   # Foreground (Text)

export CURSOR_COLOR="#CFCFCF" # Cursor

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
