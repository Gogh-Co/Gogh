#!/usr/bin/env bash

export PROFILE_NAME="Emerald Synth"

export COLOR_01="#0A0118"           # Black (Host)
export COLOR_02="#FF2A6D"           # Red (Syntax string)
export COLOR_03="#00E67E"           # Green (Command)
export COLOR_04="#FFCC66"           # Yellow (Command second)
export COLOR_05="#8B9CF7"           # Blue (Path)
export COLOR_06="#FF79C6"           # Magenta (Syntax var)
export COLOR_07="#4DD0E1"           # Cyan (Prompt)
export COLOR_08="#F0E6FF"           # White

export COLOR_09="#6A5585"           # Bright Black
export COLOR_10="#FF5C8A"           # Bright Red (Command error)
export COLOR_11="#40FFDD"           # Bright Green (Exec)
export COLOR_12="#FFE099"           # Bright Yellow
export COLOR_13="#B0B8FC"           # Bright Blue (Folder)
export COLOR_14="#FF9ED0"           # Bright Magenta
export COLOR_15="#7EE0EC"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#0D0221"   # Background
export FOREGROUND_COLOR="#00FFCC"   # Foreground (Text)

export CURSOR_COLOR="#FF79C6" # Cursor

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
