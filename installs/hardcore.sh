#!/usr/bin/env bash

export PROFILE_NAME="Hardcore"

export COLOR_01="#1B1D1E"           # Black (Host)
export COLOR_02="#F92672"           # Red (Syntax string)
export COLOR_03="#A6E22E"           # Green (Command)
export COLOR_04="#FD971F"           # Yellow (Command second)
export COLOR_05="#66D9EF"           # Blue (Path)
export COLOR_06="#9E6FFE"           # Magenta (Syntax var)
export COLOR_07="#5E7175"           # Cyan (Prompt)
export COLOR_08="#CCCCC6"           # White

export COLOR_09="#505354"           # Bright Black
export COLOR_10="#FF669D"           # Bright Red (Command error)
export COLOR_11="#BEED5F"           # Bright Green (Exec)
export COLOR_12="#E6DB74"           # Bright Yellow
export COLOR_13="#66D9EF"           # Bright Blue (Folder)
export COLOR_14="#9E6FFE"           # Bright Magenta
export COLOR_15="#A3BABF"           # Bright Cyan
export COLOR_16="#F8F8F2"           # Bright White

export BACKGROUND_COLOR="#121212"   # Background
export FOREGROUND_COLOR="#A0A0A0"   # Foreground (Text)

export CURSOR_COLOR="#A0A0A0" # Cursor

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
