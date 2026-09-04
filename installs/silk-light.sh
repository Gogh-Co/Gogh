#!/usr/bin/env bash

export PROFILE_NAME="Silk Light"

export COLOR_01="#E9F1EF"           # Black (Host)
export COLOR_02="#CF432E"           # Red (Syntax string)
export COLOR_03="#6CA38C"           # Green (Command)
export COLOR_04="#CFAD25"           # Yellow (Command second)
export COLOR_05="#39AAC9"           # Blue (Path)
export COLOR_06="#6E6582"           # Magenta (Syntax var)
export COLOR_07="#329CA2"           # Cyan (Prompt)
export COLOR_08="#385156"           # White

export COLOR_09="#5C787B"           # Bright Black
export COLOR_10="#CF432E"           # Bright Red (Command error)
export COLOR_11="#6CA38C"           # Bright Green (Exec)
export COLOR_12="#CFAD25"           # Bright Yellow
export COLOR_13="#39AAC9"           # Bright Blue (Folder)
export COLOR_14="#6E6582"           # Bright Magenta
export COLOR_15="#329CA2"           # Bright Cyan
export COLOR_16="#D2FAFF"           # Bright White

export BACKGROUND_COLOR="#E9F1EF"   # Background
export FOREGROUND_COLOR="#385156"   # Foreground (Text)

export CURSOR_COLOR="#385156" # Cursor

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
