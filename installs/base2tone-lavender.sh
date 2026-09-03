#!/usr/bin/env bash

export PROFILE_NAME="Base2Tone Lavender"

export COLOR_01="#201D2A"           # Black (Host)
export COLOR_02="#9375F5"           # Red (Syntax string)
export COLOR_03="#D294FF"           # Green (Command)
export COLOR_04="#ECD1FF"           # Yellow (Command second)
export COLOR_05="#A286FD"           # Blue (Path)
export COLOR_06="#D294FF"           # Magenta (Syntax var)
export COLOR_07="#B5A0FE"           # Cyan (Prompt)
export COLOR_08="#9992B0"           # White

export COLOR_09="#625A7C"           # Bright Black
export COLOR_10="#DBA8FF"           # Bright Red (Command error)
export COLOR_11="#2C2839"           # Bright Green (Exec)
export COLOR_12="#4B455F"           # Bright Yellow
export COLOR_13="#6E658B"           # Bright Blue (Folder)
export COLOR_14="#DCD2FE"           # Bright Magenta
export COLOR_15="#CA80FF"           # Bright Cyan
export COLOR_16="#EFEBFF"           # Bright White

export BACKGROUND_COLOR="#201D2A"   # Background
export FOREGROUND_COLOR="#9992B0"   # Foreground (Text)

export CURSOR_COLOR="#B042FF" # Cursor

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
