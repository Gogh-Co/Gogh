#!/usr/bin/env bash

export PROFILE_NAME="Karma Dark"

export COLOR_01="#0A0E14"           # Black (Host)
export COLOR_02="#FC618D"           # Red (Syntax string)
export COLOR_03="#7BD88F"           # Green (Command)
export COLOR_04="#FCE566"           # Yellow (Command second)
export COLOR_05="#5AD4E6"           # Blue (Path)
export COLOR_06="#AF98E6"           # Magenta (Syntax var)
export COLOR_07="#5AD4E6"           # Cyan (Prompt)
export COLOR_08="#BAB6C0"           # White

export COLOR_09="#69676C"           # Bright Black
export COLOR_10="#FF7BA0"           # Bright Red (Command error)
export COLOR_11="#9CE3AB"           # Bright Green (Exec)
export COLOR_12="#FCE566"           # Bright Yellow
export COLOR_13="#7FE0EE"           # Bright Blue (Folder)
export COLOR_14="#C3B0F0"           # Bright Magenta
export COLOR_15="#7FE0EE"           # Bright Cyan
export COLOR_16="#F7F1FF"           # Bright White

export BACKGROUND_COLOR="#0A0E14"   # Background
export FOREGROUND_COLOR="#F7F1FF"   # Foreground (Text)

export CURSOR_COLOR="#FCE566" # Cursor

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
