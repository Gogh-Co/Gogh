#!/usr/bin/env bash

export PROFILE_NAME="novmbr"

export COLOR_01="#282A2E"           # Black (Host)
export COLOR_02="#97673D"           # Red (Syntax string)
export COLOR_03="#A0AC68"           # Green (Command)
export COLOR_04="#C6A869"           # Yellow (Command second)
export COLOR_05="#457B7B"           # Blue (Path)
export COLOR_06="#AE8B72"           # Magenta (Syntax var)
export COLOR_07="#5E867F"           # Cyan (Prompt)
export COLOR_08="#C4B9AD"           # White

export COLOR_09="#4E423B"           # Bright Black
export COLOR_10="#97673D"           # Bright Red (Command error)
export COLOR_11="#A0AC68"           # Bright Green (Exec)
export COLOR_12="#C6A869"           # Bright Yellow
export COLOR_13="#457B7B"           # Bright Blue (Folder)
export COLOR_14="#AE8B72"           # Bright Magenta
export COLOR_15="#5E867F"           # Bright Cyan
export COLOR_16="#C4B9AD"           # Bright White

export BACKGROUND_COLOR="#231D1A"   # Background
export FOREGROUND_COLOR="#C4B9AD"   # Foreground (Text)

export CURSOR_COLOR="#C4B9AD" # Cursor

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
