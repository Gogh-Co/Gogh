#!/usr/bin/env bash

export PROFILE_NAME="Monokai Pro Spectrum"

export COLOR_01="#363537"           # Black (Host)
export COLOR_02="#FC618D"           # Red (Syntax string)
export COLOR_03="#7BD88F"           # Green (Command)
export COLOR_04="#FCE566"           # Yellow (Command second)
export COLOR_05="#FD9353"           # Blue (Path)
export COLOR_06="#948AE3"           # Magenta (Syntax var)
export COLOR_07="#5AD4E6"           # Cyan (Prompt)
export COLOR_08="#F7F1FF"           # White

export COLOR_09="#A1A1A1"           # Bright Black
export COLOR_10="#FC618D"           # Bright Red (Command error)
export COLOR_11="#7BD88F"           # Bright Green (Exec)
export COLOR_12="#FCE566"           # Bright Yellow
export COLOR_13="#FD9353"           # Bright Blue (Folder)
export COLOR_14="#948AE3"           # Bright Magenta
export COLOR_15="#5AD4E6"           # Bright Cyan
export COLOR_16="#F7F1FF"           # Bright White

export BACKGROUND_COLOR="#363537"   # Background
export FOREGROUND_COLOR="#F7F1FF"   # Foreground (Text)

export CURSOR_COLOR="#F7F1FF" # Cursor

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
