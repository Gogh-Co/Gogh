#!/usr/bin/env bash

export PROFILE_NAME="Patina Light"

export COLOR_01="#2E2A24"           # Black (Host)
export COLOR_02="#9B3B3B"           # Red (Syntax string)
export COLOR_03="#34644C"           # Green (Command)
export COLOR_04="#6E5817"           # Yellow (Command second)
export COLOR_05="#2F626F"           # Blue (Path)
export COLOR_06="#7A4F47"           # Magenta (Syntax var)
export COLOR_07="#2E6260"           # Cyan (Prompt)
export COLOR_08="#5A5248"           # White

export COLOR_09="#625A51"           # Bright Black
export COLOR_10="#833333"           # Bright Red (Command error)
export COLOR_11="#2D5839"           # Bright Green (Exec)
export COLOR_12="#634E14"           # Bright Yellow
export COLOR_13="#2C5660"           # Bright Blue (Folder)
export COLOR_14="#6D463E"           # Bright Magenta
export COLOR_15="#285654"           # Bright Cyan
export COLOR_16="#393A34"           # Bright White

export BACKGROUND_COLOR="#DDD7C4"   # Background
export FOREGROUND_COLOR="#2E2A24"   # Foreground (Text)

export CURSOR_COLOR="#2E2A24" # Cursor

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
