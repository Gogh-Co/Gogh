#!/usr/bin/env bash

export PROFILE_NAME="Cassette Tape"

export COLOR_01="#514339"           # Black (Host)
export COLOR_02="#B91C1C"           # Red (Syntax string)
export COLOR_03="#3F6212"           # Green (Command)
export COLOR_04="#BE123C"           # Yellow (Command second)
export COLOR_05="#7C2D12"           # Blue (Path)
export COLOR_06="#0F766E"           # Magenta (Syntax var)
export COLOR_07="#B45309"           # Cyan (Prompt)
export COLOR_08="#6B4F3F"           # White

export COLOR_09="#C4B39A"           # Bright Black
export COLOR_10="#941616"           # Bright Red (Command error)
export COLOR_11="#324E0E"           # Bright Green (Exec)
export COLOR_12="#9C0F31"           # Bright Yellow
export COLOR_13="#63240E"           # Bright Blue (Folder)
export COLOR_14="#0C5E58"           # Bright Magenta
export COLOR_15="#904207"           # Bright Cyan
export COLOR_16="#2B1B12"           # Bright White

export BACKGROUND_COLOR="#FFF7ED"   # Background
export FOREGROUND_COLOR="#2B1B12"   # Foreground (Text)

export CURSOR_COLOR="#2B1B12" # Cursor

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
