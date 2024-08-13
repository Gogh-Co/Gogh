#!/usr/bin/env bash

export PROFILE_NAME="Flexoki Dark"

export COLOR_01="#282726"           # Black (Host)
export COLOR_02="#AF3029"           # Red (Syntax string)
export COLOR_03="#66800B"           # Green (Command)
export COLOR_04="#AD8301"           # Yellow (Command second)
export COLOR_05="#205EA6"           # Blue (Path)
export COLOR_06="#A02F6F"           # Magenta (Syntax var)
export COLOR_07="#24837B"           # Cyan (Prompt)
export COLOR_08="#E6E4D9"           # White

export COLOR_09="#343331"           # Bright Black
export COLOR_10="#D14D41"           # Bright Red (Command error)
export COLOR_11="#879A39"           # Bright Green (Exec)
export COLOR_12="#D0A215"           # Bright Yellow
export COLOR_13="#4385BE"           # Bright Blue (Folder)
export COLOR_14="#CE5D97"           # Bright Magenta
export COLOR_15="#3AA99F"           # Bright Cyan
export COLOR_16="#FFFCF0"           # Bright White

export BACKGROUND_COLOR="#100F0F"   # Background
export FOREGROUND_COLOR="#878580"   # Foreground (Text)

export CURSOR_COLOR="#CECDC3" # Cursor

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
