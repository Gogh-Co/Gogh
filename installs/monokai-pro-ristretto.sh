#!/usr/bin/env bash

export PROFILE_NAME="Monokai Pro Ristretto"

export COLOR_01="#2C2525"           # Black (Host)
export COLOR_02="#FD6883"           # Red (Syntax string)
export COLOR_03="#ADDA78"           # Green (Command)
export COLOR_04="#F9CC6C"           # Yellow (Command second)
export COLOR_05="#F38D70"           # Blue (Path)
export COLOR_06="#A8A9EB"           # Magenta (Syntax var)
export COLOR_07="#85DACC"           # Cyan (Prompt)
export COLOR_08="#FFF1F3"           # White

export COLOR_09="#72696A"           # Bright Black
export COLOR_10="#FD6883"           # Bright Red (Command error)
export COLOR_11="#ADDA78"           # Bright Green (Exec)
export COLOR_12="#F9CC6C"           # Bright Yellow
export COLOR_13="#F38D70"           # Bright Blue (Folder)
export COLOR_14="#A8A9EB"           # Bright Magenta
export COLOR_15="#85DACC"           # Bright Cyan
export COLOR_16="#FFF1F3"           # Bright White

export BACKGROUND_COLOR="#2C2525"   # Background
export FOREGROUND_COLOR="#FFF1F3"   # Foreground (Text)

export CURSOR_COLOR="#C3B7B8" # Cursor

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
