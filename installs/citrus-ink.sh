#!/usr/bin/env bash

export PROFILE_NAME="Citrus Ink"

export COLOR_01="#14201E"           # Black (Host)
export COLOR_02="#FF6B5B"           # Red (Syntax string)
export COLOR_03="#5FD3A0"           # Green (Command)
export COLOR_04="#E6C84A"           # Yellow (Command second)
export COLOR_05="#C2EF45"           # Blue (Path)
export COLOR_06="#F2B441"           # Magenta (Syntax var)
export COLOR_07="#CFE89A"           # Cyan (Prompt)
export COLOR_08="#EAF0E2"           # White

export COLOR_09="#4F6B5E"           # Bright Black
export COLOR_10="#FF8174"           # Bright Red (Command error)
export COLOR_11="#72D8AB"           # Bright Green (Exec)
export COLOR_12="#F2A23E"           # Bright Yellow
export COLOR_13="#B8E62E"           # Bright Blue (Folder)
export COLOR_14="#B8E62E"           # Bright Magenta
export COLOR_15="#D5EBA6"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#0B1413"   # Background
export FOREGROUND_COLOR="#EAF0E2"   # Foreground (Text)

export CURSOR_COLOR="#B8E62E" # Cursor

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
