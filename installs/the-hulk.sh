#!/usr/bin/env bash

export PROFILE_NAME="The Hulk"

export COLOR_01="#1B1D1E"           # Black (Host)
export COLOR_02="#269D1B"           # Red (Syntax string)
export COLOR_03="#13CE30"           # Green (Command)
export COLOR_04="#63E457"           # Yellow (Command second)
export COLOR_05="#2525F5"           # Blue (Path)
export COLOR_06="#641F74"           # Magenta (Syntax var)
export COLOR_07="#378CA9"           # Cyan (Prompt)
export COLOR_08="#D9D8D1"           # White

export COLOR_09="#505354"           # Bright Black
export COLOR_10="#8DFF2A"           # Bright Red (Command error)
export COLOR_11="#48FF77"           # Bright Green (Exec)
export COLOR_12="#3AFE16"           # Bright Yellow
export COLOR_13="#506B95"           # Bright Blue (Folder)
export COLOR_14="#72589D"           # Bright Magenta
export COLOR_15="#4085A6"           # Bright Cyan
export COLOR_16="#E5E6E1"           # Bright White

export BACKGROUND_COLOR="#1B1D1E"   # Background
export FOREGROUND_COLOR="#B5B5B5"   # Foreground (Text)

export CURSOR_COLOR="#16B61B" # Cursor

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
