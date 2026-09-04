#!/usr/bin/env bash

export PROFILE_NAME="Darkmoss"

export COLOR_01="#171E1F"           # Black (Host)
export COLOR_02="#FF4658"           # Red (Syntax string)
export COLOR_03="#499180"           # Green (Command)
export COLOR_04="#FDB11F"           # Yellow (Command second)
export COLOR_05="#498091"           # Blue (Path)
export COLOR_06="#9BC0C8"           # Magenta (Syntax var)
export COLOR_07="#66D9EF"           # Cyan (Prompt)
export COLOR_08="#C7C7A5"           # White

export COLOR_09="#555E5F"           # Bright Black
export COLOR_10="#FF4658"           # Bright Red (Command error)
export COLOR_11="#499180"           # Bright Green (Exec)
export COLOR_12="#FDB11F"           # Bright Yellow
export COLOR_13="#498091"           # Bright Blue (Folder)
export COLOR_14="#9BC0C8"           # Bright Magenta
export COLOR_15="#66D9EF"           # Bright Cyan
export COLOR_16="#E1EAEF"           # Bright White

export BACKGROUND_COLOR="#171E1F"   # Background
export FOREGROUND_COLOR="#C7C7A5"   # Foreground (Text)

export CURSOR_COLOR="#C7C7A5" # Cursor

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
