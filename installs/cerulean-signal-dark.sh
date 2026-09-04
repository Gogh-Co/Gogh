#!/usr/bin/env bash

export PROFILE_NAME="Cerulean Signal Dark"

export COLOR_01="#101722"           # Black (Host)
export COLOR_02="#FF8A9A"           # Red (Syntax string)
export COLOR_03="#70E1B0"           # Green (Command)
export COLOR_04="#E2C85F"           # Yellow (Command second)
export COLOR_05="#7DD3FF"           # Blue (Path)
export COLOR_06="#FF74D4"           # Magenta (Syntax var)
export COLOR_07="#58D9DF"           # Cyan (Prompt)
export COLOR_08="#DCE6F2"           # White

export COLOR_09="#8FA0B5"           # Bright Black
export COLOR_10="#FF9CAC"           # Bright Red (Command error)
export COLOR_11="#8BE7BD"           # Bright Green (Exec)
export COLOR_12="#F4DC76"           # Bright Yellow
export COLOR_13="#9ADFFF"           # Bright Blue (Folder)
export COLOR_14="#FF8BDD"           # Bright Magenta
export COLOR_15="#72E7EB"           # Bright Cyan
export COLOR_16="#F7F9FC"           # Bright White

export BACKGROUND_COLOR="#101722"   # Background
export FOREGROUND_COLOR="#DCE6F2"   # Foreground (Text)

export CURSOR_COLOR="#DCE6F2" # Cursor

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
