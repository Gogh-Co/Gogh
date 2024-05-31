#!/usr/bin/env bash

export PROFILE_NAME="Soft Server"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#A2686A"           # Red (Syntax string)
export COLOR_03="#9AA56A"           # Green (Command)
export COLOR_04="#A3906A"           # Yellow (Command second)
export COLOR_05="#6B8FA3"           # Blue (Path)
export COLOR_06="#6A71A3"           # Magenta (Syntax var)
export COLOR_07="#6BA58F"           # Cyan (Prompt)
export COLOR_08="#99A3A2"           # White

export COLOR_09="#666C6C"           # Bright Black
export COLOR_10="#DD5C60"           # Bright Red (Command error)
export COLOR_11="#BFDF55"           # Bright Green (Exec)
export COLOR_12="#DEB360"           # Bright Yellow
export COLOR_13="#62B1DF"           # Bright Blue (Folder)
export COLOR_14="#606EDF"           # Bright Magenta
export COLOR_15="#64E39C"           # Bright Cyan
export COLOR_16="#D2E0DE"           # Bright White

export BACKGROUND_COLOR="#242626"   # Background
export FOREGROUND_COLOR="#99A3A2"   # Foreground (Text)

export CURSOR_COLOR="#99A3A2" # Cursor

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
