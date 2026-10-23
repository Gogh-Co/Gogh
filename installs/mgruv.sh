#!/usr/bin/env bash

export PROFILE_NAME="mgruv"

export COLOR_01="#282828"           # Black (Host)
export COLOR_02="#C58B8B"           # Red (Syntax string)
export COLOR_03="#86A987"           # Green (Command)
export COLOR_04="#C6A15B"           # Yellow (Command second)
export COLOR_05="#7E9FC0"           # Blue (Path)
export COLOR_06="#9B829B"           # Magenta (Syntax var)
export COLOR_07="#7BA6A3"           # Cyan (Prompt)
export COLOR_08="#D4C2A0"           # White

export COLOR_09="#6C6C6C"           # Bright Black
export COLOR_10="#E0A5A0"           # Bright Red (Command error)
export COLOR_11="#AAC49D"           # Bright Green (Exec)
export COLOR_12="#DEC17A"           # Bright Yellow
export COLOR_13="#A9BED2"           # Bright Blue (Folder)
export COLOR_14="#C0A6B9"           # Bright Magenta
export COLOR_15="#A8C5B7"           # Bright Cyan
export COLOR_16="#E8DCB6"           # Bright White

export BACKGROUND_COLOR="#1E2021"   # Background
export FOREGROUND_COLOR="#D4C2A0"   # Foreground (Text)

export CURSOR_COLOR="#B8A98A" # Cursor

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
