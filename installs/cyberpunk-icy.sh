#!/usr/bin/env bash

export PROFILE_NAME="cyberpunk-icy"

export COLOR_01="#1A1A2E"           # Black (Host)
export COLOR_02="#FF0055"           # Red (Syntax string)
export COLOR_03="#00FF9F"           # Green (Command)
export COLOR_04="#FFFC00"           # Yellow (Command second)
export COLOR_05="#7B2FFF"           # Blue (Path)
export COLOR_06="#FF00FF"           # Magenta (Syntax var)
export COLOR_07="#00FFFF"           # Cyan (Prompt)
export COLOR_08="#D4B3F7"           # White

export COLOR_09="#2A2A4E"           # Bright Black
export COLOR_10="#FF3377"           # Bright Red (Command error)
export COLOR_11="#33FFB2"           # Bright Green (Exec)
export COLOR_12="#FFFE33"           # Bright Yellow
export COLOR_13="#9955FF"           # Bright Blue (Folder)
export COLOR_14="#FF55FF"           # Bright Magenta
export COLOR_15="#55FFFF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#0A0A0F"   # Background
export FOREGROUND_COLOR="#D4B3F7"   # Foreground (Text)

export CURSOR_COLOR="#00FFFF" # Cursor

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
