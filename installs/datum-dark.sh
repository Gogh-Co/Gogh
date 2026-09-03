#!/usr/bin/env bash

export PROFILE_NAME="datum (dark)"

export COLOR_01="#2B2F35"           # Black (Host)
export COLOR_02="#FE9864"           # Red (Syntax string)
export COLOR_03="#54DCAA"           # Green (Command)
export COLOR_04="#E8DF69"           # Yellow (Command second)
export COLOR_05="#69B9F7"           # Blue (Path)
export COLOR_06="#FA94CD"           # Magenta (Syntax var)
export COLOR_07="#6AE5EC"           # Cyan (Prompt)
export COLOR_08="#DBE0E8"           # White

export COLOR_09="#8F98A3"           # Bright Black
export COLOR_10="#F8BD5F"           # Bright Red (Command error)
export COLOR_11="#54DCAA"           # Bright Green (Exec)
export COLOR_12="#FCDCAD"           # Bright Yellow
export COLOR_13="#B2DAFB"           # Bright Blue (Folder)
export COLOR_14="#F5B9D9"           # Bright Magenta
export COLOR_15="#A5F5F9"           # Bright Cyan
export COLOR_16="#EEF2F7"           # Bright White

export BACKGROUND_COLOR="#0F1318"   # Background
export FOREGROUND_COLOR="#DBE0E8"   # Foreground (Text)

export CURSOR_COLOR="#FA94CD" # Cursor

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
