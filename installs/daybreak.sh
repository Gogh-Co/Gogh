#!/usr/bin/env bash

export PROFILE_NAME="Daybreak"

export COLOR_01="#44413B"           # Black (Host)
export COLOR_02="#AF2817"           # Red (Syntax string)
export COLOR_03="#3C6A12"           # Green (Command)
export COLOR_04="#795900"           # Yellow (Command second)
export COLOR_05="#186875"           # Blue (Path)
export COLOR_06="#754193"           # Magenta (Syntax var)
export COLOR_07="#006A62"           # Cyan (Prompt)
export COLOR_08="#6E6B62"           # White

export COLOR_09="#8C8579"           # Bright Black
export COLOR_10="#C03A27"           # Bright Red (Command error)
export COLOR_11="#538625"           # Bright Green (Exec)
export COLOR_12="#9A4C1F"           # Bright Yellow
export COLOR_13="#207887"           # Bright Blue (Folder)
export COLOR_14="#8552A3"           # Bright Magenta
export COLOR_15="#087A71"           # Bright Cyan
export COLOR_16="#2E2C27"           # Bright White

export BACKGROUND_COLOR="#F3EFE8"   # Background
export FOREGROUND_COLOR="#44413B"   # Foreground (Text)

export CURSOR_COLOR="#A25327" # Cursor

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
