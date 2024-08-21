#!/usr/bin/env bash

export PROFILE_NAME="Base2Tone Forest"

export COLOR_01="#2a2d2a"           # Black (Host)
export COLOR_02="#5c705c"           # Red (Syntax string)
export COLOR_03="#bfd454"           # Green (Command)
export COLOR_04="#e5fb79"           # Yellow (Command second)
export COLOR_05="#687d68"           # Blue (Path)
export COLOR_06="#bfd454"           # Magenta (Syntax var)
export COLOR_07="#8fae8f"           # Cyan (Prompt)
export COLOR_08="#a1b5a1"           # White

export COLOR_09="#535f53"           # Bright Black
export COLOR_10="#cbe25a"           # Bright Red (Command error)
export COLOR_11="#353b35"           # Bright Green (Exec)
export COLOR_12="#485148"           # Bright Yellow
export COLOR_13="#5e6e5e"           # Bright Blue (Folder)
export COLOR_14="#c8e4c8"           # Bright Magenta
export COLOR_15="#b1c44f"           # Bright Cyan
export COLOR_16="#f0fff0"           # Bright White

export BACKGROUND_COLOR="#2a2d2a"   # Background
export FOREGROUND_COLOR="#a1b5a1"   # Foreground (Text)

export CURSOR_COLOR="#818b4b" # Cursor

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
