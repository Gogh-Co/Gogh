#!/usr/bin/env bash

export PROFILE_NAME="Srcery"

export COLOR_01="#1C1B19"           # Black (Host)
export COLOR_02="#EF2F27"           # Red (Syntax string)
export COLOR_03="#519F50"           # Green (Command)
export COLOR_04="#FBB829"           # Yellow (Command second)
export COLOR_05="#2C78BF"           # Blue (Path)
export COLOR_06="#E02C6D"           # Magenta (Syntax var)
export COLOR_07="#0AAEB3"           # Cyan (Prompt)
export COLOR_08="#BAA67F"           # White

export COLOR_09="#918175"           # Bright Black
export COLOR_10="#F75341"           # Bright Red (Command error)
export COLOR_11="#98BC37"           # Bright Green (Exec)
export COLOR_12="#FED06E"           # Bright Yellow
export COLOR_13="#68A8E4"           # Bright Blue (Folder)
export COLOR_14="#FF5C8F"           # Bright Magenta
export COLOR_15="#2BE4D0"           # Bright Cyan
export COLOR_16="#FCE8C3"           # Bright White

export BACKGROUND_COLOR="#1C1B19"   # Background
export FOREGROUND_COLOR="#FCE8C3"   # Foreground (Text)

export CURSOR_COLOR="#FBB829" # Cursor

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
