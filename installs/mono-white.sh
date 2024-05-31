#!/usr/bin/env bash

export PROFILE_NAME="Mono White"

export COLOR_01="#3B3B3B"           # Black (Host)
export COLOR_02="#FAFAFA"           # Red (Syntax string)
export COLOR_03="#FAFAFA"           # Green (Command)
export COLOR_04="#FAFAFA"           # Yellow (Command second)
export COLOR_05="#FAFAFA"           # Blue (Path)
export COLOR_06="#FAFAFA"           # Magenta (Syntax var)
export COLOR_07="#FAFAFA"           # Cyan (Prompt)
export COLOR_08="#FAFAFA"           # White

export COLOR_09="#FAFAFA"           # Bright Black
export COLOR_10="#FAFAFA"           # Bright Red (Command error)
export COLOR_11="#FAFAFA"           # Bright Green (Exec)
export COLOR_12="#FAFAFA"           # Bright Yellow
export COLOR_13="#FAFAFA"           # Bright Blue (Folder)
export COLOR_14="#FAFAFA"           # Bright Magenta
export COLOR_15="#FAFAFA"           # Bright Cyan
export COLOR_16="#FAFAFA"           # Bright White

export BACKGROUND_COLOR="#262626"   # Background
export FOREGROUND_COLOR="#FAFAFA"   # Foreground (Text)

export CURSOR_COLOR="#FAFAFA" # Cursor

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
