#!/usr/bin/env bash

export PROFILE_NAME="Base2Tone Field"

export COLOR_01="#18201E"           # Black (Host)
export COLOR_02="#0FBDA0"           # Red (Syntax string)
export COLOR_03="#3BE381"           # Green (Command)
export COLOR_04="#85FFB8"           # Yellow (Command second)
export COLOR_05="#25D0B4"           # Blue (Path)
export COLOR_06="#3BE381"           # Magenta (Syntax var)
export COLOR_07="#40DDC3"           # Cyan (Prompt)
export COLOR_08="#8EA4A0"           # White

export COLOR_09="#5A6D6A"           # Bright Black
export COLOR_10="#55EC94"           # Bright Red (Command error)
export COLOR_11="#242E2C"           # Bright Green (Exec)
export COLOR_12="#42524F"           # Bright Yellow
export COLOR_13="#667A77"           # Bright Blue (Folder)
export COLOR_14="#88F2E0"           # Bright Magenta
export COLOR_15="#25D46E"           # Bright Cyan
export COLOR_16="#A8FFF1"           # Bright White

export BACKGROUND_COLOR="#18201E"   # Background
export FOREGROUND_COLOR="#8EA4A0"   # Foreground (Text)

export CURSOR_COLOR="#00943E" # Cursor

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
