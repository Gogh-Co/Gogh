#!/usr/bin/env bash

export PROFILE_NAME="Atelier Savanna"

export COLOR_01="#B16139"           # Black (Host)
export COLOR_02="#B16139"           # Red (Syntax string)
export COLOR_03="#489963"           # Green (Command)
export COLOR_04="#A07E3B"           # Yellow (Command second)
export COLOR_05="#478C90"           # Blue (Path)
export COLOR_06="#867469"           # Magenta (Syntax var)
export COLOR_07="#1C9AA0"           # Cyan (Prompt)
export COLOR_08="#DFE7E2"           # White

export COLOR_09="#5F6D64"           # Bright Black
export COLOR_10="#9F713C"           # Bright Red (Command error)
export COLOR_11="#489963"           # Bright Green (Exec)
export COLOR_12="#A07E3B"           # Bright Yellow
export COLOR_13="#55859B"           # Bright Blue (Folder)
export COLOR_14="#867469"           # Bright Magenta
export COLOR_15="#1C9AA0"           # Bright Cyan
export COLOR_16="#ECF4EE"           # Bright White

export BACKGROUND_COLOR="#171C19"   # Background
export FOREGROUND_COLOR="#78877D"   # Foreground (Text)

export CURSOR_COLOR="#78877D" # Cursor

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
