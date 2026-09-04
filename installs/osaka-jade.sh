#!/usr/bin/env bash

export PROFILE_NAME="Osaka Jade"

export COLOR_01="#23372B"           # Black (Host)
export COLOR_02="#FF5345"           # Red (Syntax string)
export COLOR_03="#549E6A"           # Green (Command)
export COLOR_04="#459451"           # Yellow (Command second)
export COLOR_05="#509475"           # Blue (Path)
export COLOR_06="#D2689C"           # Magenta (Syntax var)
export COLOR_07="#2DD5B7"           # Cyan (Prompt)
export COLOR_08="#F6F5DD"           # White

export COLOR_09="#53685B"           # Bright Black
export COLOR_10="#DB9F9C"           # Bright Red (Command error)
export COLOR_11="#143614"           # Bright Green (Exec)
export COLOR_12="#E5C736"           # Bright Yellow
export COLOR_13="#ACD4CF"           # Bright Blue (Folder)
export COLOR_14="#75BBB3"           # Bright Magenta
export COLOR_15="#8CD3CB"           # Bright Cyan
export COLOR_16="#9EEBB3"           # Bright White

export BACKGROUND_COLOR="#111C18"   # Background
export FOREGROUND_COLOR="#C1C497"   # Foreground (Text)

export CURSOR_COLOR="#C1C497" # Cursor

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
