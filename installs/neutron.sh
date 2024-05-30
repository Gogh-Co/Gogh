#!/usr/bin/env bash

export PROFILE_NAME="Neutron"

export COLOR_01="#23252B"           # Black (Host)
export COLOR_02="#B54036"           # Red (Syntax string)
export COLOR_03="#5AB977"           # Green (Command)
export COLOR_04="#DEB566"           # Yellow (Command second)
export COLOR_05="#6A7C93"           # Blue (Path)
export COLOR_06="#A4799D"           # Magenta (Syntax var)
export COLOR_07="#3F94A8"           # Cyan (Prompt)
export COLOR_08="#E6E8EF"           # White

export COLOR_09="#23252B"           # Bright Black
export COLOR_10="#B54036"           # Bright Red (Command error)
export COLOR_11="#5AB977"           # Bright Green (Exec)
export COLOR_12="#DEB566"           # Bright Yellow
export COLOR_13="#6A7C93"           # Bright Blue (Folder)
export COLOR_14="#A4799D"           # Bright Magenta
export COLOR_15="#3F94A8"           # Bright Cyan
export COLOR_16="#EBEDF2"           # Bright White

export BACKGROUND_COLOR="#1C1E22"   # Background
export FOREGROUND_COLOR="#E6E8EF"   # Foreground (Text)

export CURSOR_COLOR="#E6E8EF" # Cursor

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
