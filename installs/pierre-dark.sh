#!/usr/bin/env bash

export PROFILE_NAME="Pierre Dark"

export COLOR_01="#141415"           # Black (Host)
export COLOR_02="#FF2E3F"           # Red (Syntax string)
export COLOR_03="#0DBE4E"           # Green (Command)
export COLOR_04="#FFCA00"           # Yellow (Command second)
export COLOR_05="#009FFF"           # Blue (Path)
export COLOR_06="#C635E4"           # Magenta (Syntax var)
export COLOR_07="#08C0EF"           # Cyan (Prompt)
export COLOR_08="#C6C6C8"           # White

export COLOR_09="#6C6C71"           # Bright Black
export COLOR_10="#FF6762"           # Bright Red (Command error)
export COLOR_11="#5ECC71"           # Bright Green (Exec)
export COLOR_12="#FFD452"           # Bright Yellow
export COLOR_13="#69B1FF"           # Bright Blue (Folder)
export COLOR_14="#D568EA"           # Bright Magenta
export COLOR_15="#68CDF2"           # Bright Cyan
export COLOR_16="#FBFBFB"           # Bright White

export BACKGROUND_COLOR="#070707"   # Background
export FOREGROUND_COLOR="#FBFBFB"   # Foreground (Text)

export CURSOR_COLOR="#009FFF" # Cursor

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
