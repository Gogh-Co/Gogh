#!/usr/bin/env bash

export PROFILE_NAME="Bluish"

export COLOR_01="#0B0B0C"           # Black (Host)
export COLOR_02="#377FC4"           # Red (Syntax string)
export COLOR_03="#2691E7"           # Green (Command)
export COLOR_04="#2090C1"           # Yellow (Command second)
export COLOR_05="#2C5E87"           # Blue (Path)
export COLOR_06="#436280"           # Magenta (Syntax var)
export COLOR_07="#547AA2"           # Cyan (Prompt)
export COLOR_08="#536679"           # White

export COLOR_09="#23272C"           # Bright Black
export COLOR_10="#66A5CC"           # Bright Red (Command error)
export COLOR_11="#59B0F2"           # Bright Green (Exec)
export COLOR_12="#4BB0D3"           # Bright Yellow
export COLOR_13="#487092"           # Bright Blue (Folder)
export COLOR_14="#50829E"           # Bright Magenta
export COLOR_15="#658795"           # Bright Cyan
export COLOR_16="#4D676B"           # Bright White

export BACKGROUND_COLOR="#2C3640"   # Background
export FOREGROUND_COLOR="#297DD3"   # Foreground (Text)

export CURSOR_COLOR="#297DD3" # Cursor

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
