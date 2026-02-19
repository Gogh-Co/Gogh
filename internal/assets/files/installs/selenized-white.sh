#!/usr/bin/env bash

export PROFILE_NAME="Selenized White"

export COLOR_01="#ebebeb"           # Black (Host)
export COLOR_02="#d6000c"           # Red (Syntax string)
export COLOR_03="#1d9700"           # Green (Command)
export COLOR_04="#c49700"           # Yellow (Command second)
export COLOR_05="#0064e4"           # Blue (Path)
export COLOR_06="#dd0f9d"           # Magenta (Syntax var)
export COLOR_07="#00ad9c"           # Cyan (Prompt)
export COLOR_08="#878787"           # White

export COLOR_09="#cdcdcd"           # Bright Black
export COLOR_10="#bf0000"           # Bright Red (Command error)
export COLOR_11="#008400"           # Bright Green (Exec)
export COLOR_12="#af8500"           # Bright Yellow
export COLOR_13="#0054cf"           # Bright Blue (Folder)
export COLOR_14="#c7008b"           # Bright Magenta
export COLOR_15="#009a8a"           # Bright Cyan
export COLOR_16="#282828"           # Bright White

export BACKGROUND_COLOR="#ffffff"   # Background
export FOREGROUND_COLOR="#474747"   # Foreground (Text)

export CURSOR_COLOR="#282828" # Cursor

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
