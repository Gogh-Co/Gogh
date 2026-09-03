#!/usr/bin/env bash

export PROFILE_NAME="Monokai Vivid"

export COLOR_01="#121212"           # Black (Host)
export COLOR_02="#FA2934"           # Red (Syntax string)
export COLOR_03="#98E123"           # Green (Command)
export COLOR_04="#FFF30A"           # Yellow (Command second)
export COLOR_05="#0443FF"           # Blue (Path)
export COLOR_06="#F800F8"           # Magenta (Syntax var)
export COLOR_07="#01B6ED"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#838383"           # Bright Black
export COLOR_10="#F6669D"           # Bright Red (Command error)
export COLOR_11="#B1E05F"           # Bright Green (Exec)
export COLOR_12="#FFF26D"           # Bright Yellow
export COLOR_13="#0443FF"           # Bright Blue (Folder)
export COLOR_14="#F200F6"           # Bright Magenta
export COLOR_15="#51CEFF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#121212"   # Background
export FOREGROUND_COLOR="#F9F9F9"   # Foreground (Text)

export CURSOR_COLOR="#FB0007" # Cursor

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
