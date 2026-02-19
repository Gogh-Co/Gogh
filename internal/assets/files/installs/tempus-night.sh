#!/usr/bin/env bash

export PROFILE_NAME="Tempus Night"

export COLOR_01="#1a1a1a"           # Black (Host)
export COLOR_02="#ff929f"           # Red (Syntax string)
export COLOR_03="#5fc940"           # Green (Command)
export COLOR_04="#c5b300"           # Yellow (Command second)
export COLOR_05="#5fb8ff"           # Blue (Path)
export COLOR_06="#ef91df"           # Magenta (Syntax var)
export COLOR_07="#1dc5c3"           # Cyan (Prompt)
export COLOR_08="#c4bdaf"           # White

export COLOR_09="#242536"           # Bright Black
export COLOR_10="#f69d6a"           # Bright Red (Command error)
export COLOR_11="#88c400"           # Bright Green (Exec)
export COLOR_12="#d7ae00"           # Bright Yellow
export COLOR_13="#8cb4f0"           # Bright Blue (Folder)
export COLOR_14="#de99f0"           # Bright Magenta
export COLOR_15="#00ca9a"           # Bright Cyan
export COLOR_16="#e0e0e0"           # Bright White

export BACKGROUND_COLOR="#1a1a1a"   # Background
export FOREGROUND_COLOR="#e0e0e0"   # Foreground (Text)

export CURSOR_COLOR="#e0e0e0" # Cursor

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
