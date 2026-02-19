#!/usr/bin/env bash

export PROFILE_NAME="Tempus Rift"

export COLOR_01="#162c22"           # Black (Host)
export COLOR_02="#c19904"           # Red (Syntax string)
export COLOR_03="#34b534"           # Green (Command)
export COLOR_04="#7fad00"           # Yellow (Command second)
export COLOR_05="#30aeb0"           # Blue (Path)
export COLOR_06="#c8954c"           # Magenta (Syntax var)
export COLOR_07="#5fad8f"           # Cyan (Prompt)
export COLOR_08="#ab9aa9"           # White

export COLOR_09="#283431"           # Bright Black
export COLOR_10="#d2a634"           # Bright Red (Command error)
export COLOR_11="#6ac134"           # Bright Green (Exec)
export COLOR_12="#82bd00"           # Bright Yellow
export COLOR_13="#56bdad"           # Bright Blue (Folder)
export COLOR_14="#cca0ba"           # Bright Magenta
export COLOR_15="#10c480"           # Bright Cyan
export COLOR_16="#bbbcbc"           # Bright White

export BACKGROUND_COLOR="#162c22"   # Background
export FOREGROUND_COLOR="#bbbcbc"   # Foreground (Text)

export CURSOR_COLOR="#bbbcbc" # Cursor

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
