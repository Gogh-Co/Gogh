#!/usr/bin/env bash

export PROFILE_NAME="Oceanic Next"

export COLOR_01="#121C21"           # Black (Host)
export COLOR_02="#E44754"           # Red (Syntax string)
export COLOR_03="#89BD82"           # Green (Command)
export COLOR_04="#F7BD51"           # Yellow (Command second)
export COLOR_05="#5486C0"           # Blue (Path)
export COLOR_06="#B77EB8"           # Magenta (Syntax var)
export COLOR_07="#50A5A4"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#52606B"           # Bright Black
export COLOR_10="#E44754"           # Bright Red (Command error)
export COLOR_11="#89BD82"           # Bright Green (Exec)
export COLOR_12="#F7BD51"           # Bright Yellow
export COLOR_13="#5486C0"           # Bright Blue (Folder)
export COLOR_14="#B77EB8"           # Bright Magenta
export COLOR_15="#50A5A4"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#121B21"   # Background
export FOREGROUND_COLOR="#B3B8C3"   # Foreground (Text)

export CURSOR_COLOR="#B3B8C3" # Cursor

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
