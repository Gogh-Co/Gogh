#!/usr/bin/env bash

export PROFILE_NAME="Chicago Night"

export COLOR_01="#1E2A24"           # Black (Host)
export COLOR_02="#C60C30"           # Red (Syntax string)
export COLOR_03="#009B3A"           # Green (Command)
export COLOR_04="#F9E300"           # Yellow (Command second)
export COLOR_05="#522398"           # Blue (Path)
export COLOR_06="#E27EA6"           # Magenta (Syntax var)
export COLOR_07="#00A1DE"           # Cyan (Prompt)
export COLOR_08="#A7B8AF"           # White

export COLOR_09="#5F7368"           # Bright Black
export COLOR_10="#C60C30"           # Bright Red (Command error)
export COLOR_11="#009B3A"           # Bright Green (Exec)
export COLOR_12="#F9E300"           # Bright Yellow
export COLOR_13="#522398"           # Bright Blue (Folder)
export COLOR_14="#E27EA6"           # Bright Magenta
export COLOR_15="#00A1DE"           # Bright Cyan
export COLOR_16="#DBE3DE"           # Bright White

export BACKGROUND_COLOR="#1E2A24"   # Background
export FOREGROUND_COLOR="#A7B8AF"   # Foreground (Text)

export CURSOR_COLOR="#A7B8AF" # Cursor

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
