#!/usr/bin/env bash

export PROFILE_NAME="Base2Tone Forest"

export COLOR_01="#2A2D2A"           # Black (Host)
export COLOR_02="#5C705C"           # Red (Syntax string)
export COLOR_03="#BFD454"           # Green (Command)
export COLOR_04="#E5FB79"           # Yellow (Command second)
export COLOR_05="#687D68"           # Blue (Path)
export COLOR_06="#BFD454"           # Magenta (Syntax var)
export COLOR_07="#8FAE8F"           # Cyan (Prompt)
export COLOR_08="#A1B5A1"           # White

export COLOR_09="#535F53"           # Bright Black
export COLOR_10="#CBE25A"           # Bright Red (Command error)
export COLOR_11="#353B35"           # Bright Green (Exec)
export COLOR_12="#485148"           # Bright Yellow
export COLOR_13="#5E6E5E"           # Bright Blue (Folder)
export COLOR_14="#C8E4C8"           # Bright Magenta
export COLOR_15="#B1C44F"           # Bright Cyan
export COLOR_16="#F0FFF0"           # Bright White

export BACKGROUND_COLOR="#2A2D2A"   # Background
export FOREGROUND_COLOR="#A1B5A1"   # Foreground (Text)

export CURSOR_COLOR="#818B4B" # Cursor

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
