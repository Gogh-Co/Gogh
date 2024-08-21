#!/usr/bin/env bash

export PROFILE_NAME="Base4Tone Classic L"

export COLOR_01="#1b2221"           # Black (Host)
export COLOR_02="#7667e4"           # Red (Syntax string)
export COLOR_03="#0da51f"           # Green (Command)
export COLOR_04="#2bda3f"           # Yellow (Command second)
export COLOR_05="#1cc4ae"           # Blue (Path)
export COLOR_06="#659efb"           # Magenta (Syntax var)
export COLOR_07="#22bf34"           # Cyan (Prompt)
export COLOR_08="#e8eeed"           # White

export COLOR_09="#070d0c"           # Bright Black
export COLOR_10="#a095f3"           # Bright Red (Command error)
export COLOR_11="#3cdd4f"           # Bright Green (Exec)
export COLOR_12="#97eda1"           # Bright Yellow
export COLOR_13="#adf0e7"           # Bright Blue (Folder)
export COLOR_14="#88b4fc"           # Bright Magenta
export COLOR_15="#93ece0"           # Bright Cyan
export COLOR_16="#f6f9f8"           # Bright White

export BACKGROUND_COLOR="#1b2221"   # Background
export FOREGROUND_COLOR="#8ea4a1"   # Foreground (Text)

export CURSOR_COLOR="#748176" # Cursor

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
