#!/usr/bin/env bash

export PROFILE_NAME="Deep Oceanic Next"

export COLOR_01="#001C1F"           # Black (Host)
export COLOR_02="#D3464D"           # Red (Syntax string)
export COLOR_03="#63B784"           # Green (Command)
export COLOR_04="#F3B863"           # Yellow (Command second)
export COLOR_05="#568CCF"           # Blue (Path)
export COLOR_06="#8B66D6"           # Magenta (Syntax var)
export COLOR_07="#4FB7AE"           # Cyan (Prompt)
export COLOR_08="#D4E1E8"           # White

export COLOR_09="#004852"           # Bright Black
export COLOR_10="#FF6670"           # Bright Red (Command error)
export COLOR_11="#72E1A6"           # Bright Green (Exec)
export COLOR_12="#FFE08A"           # Bright Yellow
export COLOR_13="#5CAEFF"           # Bright Blue (Folder)
export COLOR_14="#B788FF"           # Bright Magenta
export COLOR_15="#4DE3E3"           # Bright Cyan
export COLOR_16="#F2F7F9"           # Bright White

export BACKGROUND_COLOR="#001C1F"   # Background
export FOREGROUND_COLOR="#D4E1E8"   # Foreground (Text)

export CURSOR_COLOR="#D4E1E8" # Cursor

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
