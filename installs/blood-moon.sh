#!/usr/bin/env bash

export PROFILE_NAME="Blood Moon"

export COLOR_01="#10100E"           # Black (Host)
export COLOR_02="#C40233"           # Red (Syntax string)
export COLOR_03="#009F6B"           # Green (Command)
export COLOR_04="#FFD700"           # Yellow (Command second)
export COLOR_05="#0087BD"           # Blue (Path)
export COLOR_06="#9A4EAE"           # Magenta (Syntax var)
export COLOR_07="#20B2AA"           # Cyan (Prompt)
export COLOR_08="#C6C6C4"           # White

export COLOR_09="#696969"           # Bright Black
export COLOR_10="#FF2400"           # Bright Red (Command error)
export COLOR_11="#03C03C"           # Bright Green (Exec)
export COLOR_12="#FDFF00"           # Bright Yellow
export COLOR_13="#007FFF"           # Bright Blue (Folder)
export COLOR_14="#FF1493"           # Bright Magenta
export COLOR_15="#00CCCC"           # Bright Cyan
export COLOR_16="#FFFAFA"           # Bright White

export BACKGROUND_COLOR="#10100E"   # Background
export FOREGROUND_COLOR="#C6C6C4"   # Foreground (Text)

export CURSOR_COLOR="#C6C6C4" # Cursor

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
