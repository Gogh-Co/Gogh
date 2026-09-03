#!/usr/bin/env bash

export PROFILE_NAME="London Soho Night"

export COLOR_01="#2A221A"           # Black (Host)
export COLOR_02="#D4574A"           # Red (Syntax string)
export COLOR_03="#8FAE5E"           # Green (Command)
export COLOR_04="#E8B04A"           # Yellow (Command second)
export COLOR_05="#6A8FB5"           # Blue (Path)
export COLOR_06="#D96AA5"           # Magenta (Syntax var)
export COLOR_07="#9AB8A8"           # Cyan (Prompt)
export COLOR_08="#EBE0C8"           # White

export COLOR_09="#6B5A48"           # Bright Black
export COLOR_10="#E87765"           # Bright Red (Command error)
export COLOR_11="#AAC874"           # Bright Green (Exec)
export COLOR_12="#F4C560"           # Bright Yellow
export COLOR_13="#88A8C8"           # Bright Blue (Folder)
export COLOR_14="#ED85B8"           # Bright Magenta
export COLOR_15="#B8CEBD"           # Bright Cyan
export COLOR_16="#F8EED2"           # Bright White

export BACKGROUND_COLOR="#1A1612"   # Background
export FOREGROUND_COLOR="#EBE0C8"   # Foreground (Text)

export CURSOR_COLOR="#FF5DB1" # Cursor

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
