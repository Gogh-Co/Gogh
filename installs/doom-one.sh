#!/usr/bin/env bash

export PROFILE_NAME="Doom One"

export COLOR_01="#1b2229"           # Black (Host)
export COLOR_02="#ff6c6b"           # Red (Syntax string)
export COLOR_03="#98be65"           # Green (Command)
export COLOR_04="#ecbe7b"           # Yellow (Command second)
export COLOR_05="#2257a0"           # Blue (Path)
export COLOR_06="#a9a1e1"           # Magenta (Syntax var)
export COLOR_07="#5699af"           # Cyan (Prompt)
export COLOR_08="#5b6268"           # White

export COLOR_09="#3f444a"           # Bright Black
export COLOR_10="#da8548"           # Bright Red (Command error)
export COLOR_11="#4db5bd"           # Bright Green (Exec)
export COLOR_12="#ecbe7b"           # Bright Yellow
export COLOR_13="#51afef"           # Bright Blue (Folder)
export COLOR_14="#c678dd"           # Bright Magenta
export COLOR_15="#46d9ff"           # Bright Cyan
export COLOR_16="#bbc2cf"           # Bright White

export BACKGROUND_COLOR="#21242b"   # Background
export FOREGROUND_COLOR="#5b6268"   # Foreground (Text)

export CURSOR_COLOR="#5b6268" # Cursor

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
