#!/usr/bin/env bash

export PROFILE_NAME="Marine Dark"

export COLOR_01="#002221"           # Black (Host)
export COLOR_02="#EA3431"           # Red (Syntax string)
export COLOR_03="#00B6B6"           # Green (Command)
export COLOR_04="#F8B017"           # Yellow (Command second)
export COLOR_05="#4894FD"           # Blue (Path)
export COLOR_06="#E01DCA"           # Magenta (Syntax var)
export COLOR_07="#1AB2AD"           # Cyan (Prompt)
export COLOR_08="#99DDDB"           # White

export COLOR_09="#006562"           # Bright Black
export COLOR_10="#EA3431"           # Bright Red (Command error)
export COLOR_11="#00B6B6"           # Bright Green (Exec)
export COLOR_12="#F8B017"           # Bright Yellow
export COLOR_13="#4894FD"           # Bright Blue (Folder)
export COLOR_14="#E01DCA"           # Bright Magenta
export COLOR_15="#1AB2AD"           # Bright Cyan
export COLOR_16="#E6F6F6"           # Bright White

export BACKGROUND_COLOR="#002221"   # Background
export FOREGROUND_COLOR="#E6F8F8"   # Foreground (Text)

export CURSOR_COLOR="#E6F8F8" # Cursor

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
