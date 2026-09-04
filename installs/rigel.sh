#!/usr/bin/env bash

export PROFILE_NAME="Rigel"

export COLOR_01="#00384D"           # Black (Host)
export COLOR_02="#C43061"           # Red (Syntax string)
export COLOR_03="#7FC06E"           # Green (Command)
export COLOR_04="#F08E48"           # Yellow (Command second)
export COLOR_05="#1C8DB2"           # Blue (Path)
export COLOR_06="#C694FF"           # Magenta (Syntax var)
export COLOR_07="#00CCCC"           # Cyan (Prompt)
export COLOR_08="#77929E"           # White

export COLOR_09="#517F8D"           # Bright Black
export COLOR_10="#FF5A67"           # Bright Red (Command error)
export COLOR_11="#9CF087"           # Bright Green (Exec)
export COLOR_12="#FFCC1B"           # Bright Yellow
export COLOR_13="#7EB2DD"           # Bright Blue (Folder)
export COLOR_14="#FB94FF"           # Bright Magenta
export COLOR_15="#00FFFF"           # Bright Cyan
export COLOR_16="#B7CFF9"           # Bright White

export BACKGROUND_COLOR="#002635"   # Background
export FOREGROUND_COLOR="#E6E6DC"   # Foreground (Text)

export CURSOR_COLOR="#E6E6DC" # Cursor

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
