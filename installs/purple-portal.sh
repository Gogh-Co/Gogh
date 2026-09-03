#!/usr/bin/env bash

export PROFILE_NAME="Purple Portal"

export COLOR_01="#483A57"           # Black (Host)
export COLOR_02="#FB7185"           # Red (Syntax string)
export COLOR_03="#34D399"           # Green (Command)
export COLOR_04="#F472B6"           # Yellow (Command second)
export COLOR_05="#FACC15"           # Blue (Path)
export COLOR_06="#38BDF8"           # Magenta (Syntax var)
export COLOR_07="#580FF0"           # Cyan (Prompt)
export COLOR_08="#D8B4FE"           # White

export COLOR_09="#503872"           # Bright Black
export COLOR_10="#FC8D9D"           # Bright Red (Command error)
export COLOR_11="#5DDCAD"           # Bright Green (Exec)
export COLOR_12="#F68BC3"           # Bright Yellow
export COLOR_13="#FBD644"           # Bright Blue (Folder)
export COLOR_14="#60CAF9"           # Bright Magenta
export COLOR_15="#793FF3"           # Bright Cyan
export COLOR_16="#FAF5FF"           # Bright White

export BACKGROUND_COLOR="#160528"   # Background
export FOREGROUND_COLOR="#FAF5FF"   # Foreground (Text)

export CURSOR_COLOR="#FAF5FF" # Cursor

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
