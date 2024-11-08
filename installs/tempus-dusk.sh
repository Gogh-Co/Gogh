#!/usr/bin/env bash

export PROFILE_NAME="Tempus Dusk"

export COLOR_01="#1f252d"           # Black (Host)
export COLOR_02="#cb8d56"           # Red (Syntax string)
export COLOR_03="#8ba089"           # Green (Command)
export COLOR_04="#a79c46"           # Yellow (Command second)
export COLOR_05="#8c9abe"           # Blue (Path)
export COLOR_06="#b190af"           # Magenta (Syntax var)
export COLOR_07="#8e9aba"           # Cyan (Prompt)
export COLOR_08="#a29899"           # White

export COLOR_09="#2c3150"           # Bright Black
export COLOR_10="#d39d74"           # Bright Red (Command error)
export COLOR_11="#80b48f"           # Bright Green (Exec)
export COLOR_12="#bda75a"           # Bright Yellow
export COLOR_13="#9ca5de"           # Bright Blue (Folder)
export COLOR_14="#c69ac6"           # Bright Magenta
export COLOR_15="#8caeb6"           # Bright Cyan
export COLOR_16="#a2a8ba"           # Bright White

export BACKGROUND_COLOR="#1f252d"   # Background
export FOREGROUND_COLOR="#a2a8ba"   # Foreground (Text)

export CURSOR_COLOR="#a2a8ba" # Cursor

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
