#!/usr/bin/env bash

export PROFILE_NAME="Banana Blueberry"

export COLOR_01="#17141F"           # Black (Host)
export COLOR_02="#FF6B7F"           # Red (Syntax string)
export COLOR_03="#00BD9C"           # Green (Command)
export COLOR_04="#E6C62F"           # Yellow (Command second)
export COLOR_05="#22E8DF"           # Blue (Path)
export COLOR_06="#DC396A"           # Magenta (Syntax var)
export COLOR_07="#56B6C2"           # Cyan (Prompt)
export COLOR_08="#F1F1F1"           # White

export COLOR_09="#495162"           # Bright Black
export COLOR_10="#FE9EA1"           # Bright Red (Command error)
export COLOR_11="#98C379"           # Bright Green (Exec)
export COLOR_12="#F9E46B"           # Bright Yellow
export COLOR_13="#91FFF4"           # Bright Blue (Folder)
export COLOR_14="#DA70D6"           # Bright Magenta
export COLOR_15="#BCF3FF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#191323"   # Background
export FOREGROUND_COLOR="#CCCCCC"   # Foreground (Text)

export CURSOR_COLOR="#E07D13" # Cursor

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
