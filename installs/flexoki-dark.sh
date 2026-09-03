#!/usr/bin/env bash

export PROFILE_NAME="Flexoki Dark"

export COLOR_01="#100F0F"           # Black (Host)
export COLOR_02="#D14D41"           # Red (Syntax string)
export COLOR_03="#879A39"           # Green (Command)
export COLOR_04="#D0A215"           # Yellow (Command second)
export COLOR_05="#4385BE"           # Blue (Path)
export COLOR_06="#CE5D97"           # Magenta (Syntax var)
export COLOR_07="#3AA99F"           # Cyan (Prompt)
export COLOR_08="#878580"           # White

export COLOR_09="#575653"           # Bright Black
export COLOR_10="#AF3029"           # Bright Red (Command error)
export COLOR_11="#66800B"           # Bright Green (Exec)
export COLOR_12="#AD8301"           # Bright Yellow
export COLOR_13="#205EA6"           # Bright Blue (Folder)
export COLOR_14="#A02F6F"           # Bright Magenta
export COLOR_15="#24837B"           # Bright Cyan
export COLOR_16="#CECDC3"           # Bright White

export BACKGROUND_COLOR="#100F0F"   # Background
export FOREGROUND_COLOR="#CECDC3"   # Foreground (Text)

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
