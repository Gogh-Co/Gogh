#!/usr/bin/env bash

export PROFILE_NAME="Base4Tone Modern W"

export COLOR_01="#201d1e"           # Black (Host)
export COLOR_02="#21a00d"           # Red (Syntax string)
export COLOR_03="#1398aa"           # Green (Command)
export COLOR_04="#3ccadd"           # Yellow (Command second)
export COLOR_05="#eb75a2"           # Blue (Path)
export COLOR_06="#e97263"           # Magenta (Syntax var)
export COLOR_07="#23b4c7"           # Cyan (Prompt)
export COLOR_08="#ede8ea"           # White

export COLOR_09="#0d080a"           # Bright Black
export COLOR_10="#39c723"           # Bright Red (Command error)
export COLOR_11="#5ad2e2"           # Bright Green (Exec)
export COLOR_12="#a4e6ef"           # Bright Yellow
export COLOR_13="#f8bfd5"           # Bright Blue (Folder)
export COLOR_14="#f18c7e"           # Bright Magenta
export COLOR_15="#f6b1cc"           # Bright Cyan
export COLOR_16="#f9f6f7"           # Bright White

export BACKGROUND_COLOR="#201d1e"   # Background
export FOREGROUND_COLOR="#9e9498"   # Foreground (Text)

export CURSOR_COLOR="#6a878a" # Cursor

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
