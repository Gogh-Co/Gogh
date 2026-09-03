#!/usr/bin/env bash

export PROFILE_NAME="GitLab Dark"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#F57F6C"           # Red (Syntax string)
export COLOR_03="#52B87A"           # Green (Command)
export COLOR_04="#D99530"           # Yellow (Command second)
export COLOR_05="#7FB6ED"           # Blue (Path)
export COLOR_06="#F88AAF"           # Magenta (Syntax var)
export COLOR_07="#32C5D2"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#666666"           # Bright Black
export COLOR_10="#FCB5AA"           # Bright Red (Command error)
export COLOR_11="#91D4A8"           # Bright Green (Exec)
export COLOR_12="#E9BE74"           # Bright Yellow
export COLOR_13="#498DD1"           # Bright Blue (Folder)
export COLOR_14="#FCACC5"           # Bright Magenta
export COLOR_15="#5EDEE3"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#28262B"   # Background
export FOREGROUND_COLOR="#FFFFFF"   # Foreground (Text)

export CURSOR_COLOR="#FFFFFF" # Cursor

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
