#!/usr/bin/env bash

export PROFILE_NAME="Midsummer Night"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#D85069"           # Red (Syntax string)
export COLOR_03="#2DCBBE"           # Green (Command)
export COLOR_04="#E5A382"           # Yellow (Command second)
export COLOR_05="#35A5BB"           # Blue (Path)
export COLOR_06="#D34C68"           # Magenta (Syntax var)
export COLOR_07="#2DCBBE"           # Cyan (Prompt)
export COLOR_08="#B1C7C9"           # White

export COLOR_09="#666666"           # Bright Black
export COLOR_10="#D85069"           # Bright Red (Command error)
export COLOR_11="#2DCBBE"           # Bright Green (Exec)
export COLOR_12="#E5A382"           # Bright Yellow
export COLOR_13="#35A5BB"           # Bright Blue (Folder)
export COLOR_14="#D34C68"           # Bright Magenta
export COLOR_15="#2DCBBE"           # Bright Cyan
export COLOR_16="#B1C7C9"           # Bright White

export BACKGROUND_COLOR="#1C1E26"   # Background
export FOREGROUND_COLOR="#C6B8B1"   # Foreground (Text)

export CURSOR_COLOR="#C6B8B1" # Cursor

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
