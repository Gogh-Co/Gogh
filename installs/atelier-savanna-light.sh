#!/usr/bin/env bash

export PROFILE_NAME="Atelier Savanna Light"

export COLOR_01="#ECF4EE"           # Black (Host)
export COLOR_02="#B16139"           # Red (Syntax string)
export COLOR_03="#489963"           # Green (Command)
export COLOR_04="#A07E3B"           # Yellow (Command second)
export COLOR_05="#478C90"           # Blue (Path)
export COLOR_06="#55859B"           # Magenta (Syntax var)
export COLOR_07="#1C9AA0"           # Cyan (Prompt)
export COLOR_08="#526057"           # White

export COLOR_09="#78877D"           # Bright Black
export COLOR_10="#B16139"           # Bright Red (Command error)
export COLOR_11="#489963"           # Bright Green (Exec)
export COLOR_12="#A07E3B"           # Bright Yellow
export COLOR_13="#478C90"           # Bright Blue (Folder)
export COLOR_14="#55859B"           # Bright Magenta
export COLOR_15="#1C9AA0"           # Bright Cyan
export COLOR_16="#171C19"           # Bright White

export BACKGROUND_COLOR="#ECF4EE"   # Background
export FOREGROUND_COLOR="#526057"   # Foreground (Text)

export CURSOR_COLOR="#526057" # Cursor

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
