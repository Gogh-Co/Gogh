#!/usr/bin/env bash

export PROFILE_NAME="Tempus Night"

export COLOR_01="#1A1A1A"           # Black (Host)
export COLOR_02="#FF929F"           # Red (Syntax string)
export COLOR_03="#5FC940"           # Green (Command)
export COLOR_04="#C5B300"           # Yellow (Command second)
export COLOR_05="#5FB8FF"           # Blue (Path)
export COLOR_06="#EF91DF"           # Magenta (Syntax var)
export COLOR_07="#1DC5C3"           # Cyan (Prompt)
export COLOR_08="#C4BDAF"           # White

export COLOR_09="#242536"           # Bright Black
export COLOR_10="#F69D6A"           # Bright Red (Command error)
export COLOR_11="#88C400"           # Bright Green (Exec)
export COLOR_12="#D7AE00"           # Bright Yellow
export COLOR_13="#8CB4F0"           # Bright Blue (Folder)
export COLOR_14="#DE99F0"           # Bright Magenta
export COLOR_15="#00CA9A"           # Bright Cyan
export COLOR_16="#E0E0E0"           # Bright White

export BACKGROUND_COLOR="#1A1A1A"   # Background
export FOREGROUND_COLOR="#E0E0E0"   # Foreground (Text)

export CURSOR_COLOR="#E0E0E0" # Cursor

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
