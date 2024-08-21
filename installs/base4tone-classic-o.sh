#!/usr/bin/env bash

export PROFILE_NAME="Base4Tone Classic O"

export COLOR_01="#1a1d23"           # Black (Host)
export COLOR_02="#a24ad9"           # Red (Syntax string)
export COLOR_03="#0d9c89"           # Green (Command)
export COLOR_04="#1ed2ba"           # Yellow (Command second)
export COLOR_05="#74a8fb"           # Blue (Path)
export COLOR_06="#9488f2"           # Magenta (Syntax var)
export COLOR_07="#1bbba6"           # Cyan (Prompt)
export COLOR_08="#e7eaee"           # White

export COLOR_09="#07090d"           # Bright Black
export COLOR_10="#c27eed"           # Bright Red (Command error)
export COLOR_11="#2fdac3"           # Bright Green (Exec)
export COLOR_12="#93ece0"           # Bright Yellow
export COLOR_13="#c7dcff"           # Bright Blue (Folder)
export COLOR_14="#aba1f7"           # Bright Magenta
export COLOR_15="#c2d9ff"           # Bright Cyan
export COLOR_16="#f6f7f9"           # Bright White

export BACKGROUND_COLOR="#1a1d23"   # Background
export FOREGROUND_COLOR="#8995a9"   # Foreground (Text)

export CURSOR_COLOR="#6d8884" # Cursor

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
