#!/usr/bin/env bash

export PROFILE_NAME="Selenized Black"

export COLOR_01="#252525"           # Black (Host)
export COLOR_02="#ED4A46"           # Red (Syntax string)
export COLOR_03="#70B433"           # Green (Command)
export COLOR_04="#DBB32D"           # Yellow (Command second)
export COLOR_05="#368AEB"           # Blue (Path)
export COLOR_06="#EB6EB7"           # Magenta (Syntax var)
export COLOR_07="#3FC5B7"           # Cyan (Prompt)
export COLOR_08="#B9B9B9"           # White

export COLOR_09="#777777"           # Bright Black
export COLOR_10="#FF5E56"           # Bright Red (Command error)
export COLOR_11="#83C746"           # Bright Green (Exec)
export COLOR_12="#EFC541"           # Bright Yellow
export COLOR_13="#4F9CFE"           # Bright Blue (Folder)
export COLOR_14="#FF81CA"           # Bright Magenta
export COLOR_15="#56D8C9"           # Bright Cyan
export COLOR_16="#DEDEDE"           # Bright White

export BACKGROUND_COLOR="#181818"   # Background
export FOREGROUND_COLOR="#B9B9B9"   # Foreground (Text)

export CURSOR_COLOR="#777777" # Cursor

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
