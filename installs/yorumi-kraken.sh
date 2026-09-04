#!/usr/bin/env bash

export PROFILE_NAME="Yorumi Kraken"

export COLOR_01="#0E121F"           # Black (Host)
export COLOR_02="#913B3B"           # Red (Syntax string)
export COLOR_03="#697F4D"           # Green (Command)
export COLOR_04="#9D672F"           # Yellow (Command second)
export COLOR_05="#42608A"           # Blue (Path)
export COLOR_06="#614686"           # Magenta (Syntax var)
export COLOR_07="#478584"           # Cyan (Prompt)
export COLOR_08="#A7A9B5"           # White

export COLOR_09="#343742"           # Bright Black
export COLOR_10="#F47571"           # Bright Red (Command error)
export COLOR_11="#A9D07C"           # Bright Green (Exec)
export COLOR_12="#E1C084"           # Bright Yellow
export COLOR_13="#798DDC"           # Bright Blue (Folder)
export COLOR_14="#AD8FD6"           # Bright Magenta
export COLOR_15="#85E0CB"           # Bright Cyan
export COLOR_16="#C0BCE6"           # Bright White

export BACKGROUND_COLOR="#0E0D17"   # Background
export FOREGROUND_COLOR="#C0BCE6"   # Foreground (Text)

export CURSOR_COLOR="#C0BCE6" # Cursor

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
