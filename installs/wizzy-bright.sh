#!/usr/bin/env bash

export PROFILE_NAME="Wizzy Bright"

export COLOR_01="#666666"           # Black (Host)
export COLOR_02="#BF7998"           # Red (Syntax string)
export COLOR_03="#5BA6A6"           # Green (Command)
export COLOR_04="#8D8DAA"           # Yellow (Command second)
export COLOR_05="#6C88A6"           # Blue (Path)
export COLOR_06="#8F79BF"           # Magenta (Syntax var)
export COLOR_07="#6498BF"           # Cyan (Prompt)
export COLOR_08="#ABBEC5"           # White

export COLOR_09="#6F6F6F"           # Bright Black
export COLOR_10="#CF7FB3"           # Bright Red (Command error)
export COLOR_11="#75C8C8"           # Bright Green (Exec)
export COLOR_12="#AFAFDC"           # Bright Yellow
export COLOR_13="#7AADE6"           # Bright Blue (Folder)
export COLOR_14="#AF95E6"           # Bright Magenta
export COLOR_15="#82B8DF"           # Bright Cyan
export COLOR_16="#BCCFD4"           # Bright White

export BACKGROUND_COLOR="#100814"   # Background
export FOREGROUND_COLOR="#B2B8C4"   # Foreground (Text)

export CURSOR_COLOR="#B2B8C4" # Cursor

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
