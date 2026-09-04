#!/usr/bin/env bash

export PROFILE_NAME="Codeschool"

export COLOR_01="#232C31"           # Black (Host)
export COLOR_02="#2A5491"           # Red (Syntax string)
export COLOR_03="#237986"           # Green (Command)
export COLOR_04="#A03B1E"           # Yellow (Command second)
export COLOR_05="#484D79"           # Blue (Path)
export COLOR_06="#C59820"           # Magenta (Syntax var)
export COLOR_07="#B02F30"           # Cyan (Prompt)
export COLOR_08="#9EA7A6"           # White

export COLOR_09="#3F4944"           # Bright Black
export COLOR_10="#2A5491"           # Bright Red (Command error)
export COLOR_11="#237986"           # Bright Green (Exec)
export COLOR_12="#A03B1E"           # Bright Yellow
export COLOR_13="#484D79"           # Bright Blue (Folder)
export COLOR_14="#C59820"           # Bright Magenta
export COLOR_15="#B02F30"           # Bright Cyan
export COLOR_16="#B5D8F6"           # Bright White

export BACKGROUND_COLOR="#232C31"   # Background
export FOREGROUND_COLOR="#9EA7A6"   # Foreground (Text)

export CURSOR_COLOR="#9EA7A6" # Cursor

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
