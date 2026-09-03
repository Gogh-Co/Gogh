#!/usr/bin/env bash

export PROFILE_NAME="Oxide"

export COLOR_01="#262626"           # Black (Host)
export COLOR_02="#ED756E"           # Red (Syntax string)
export COLOR_03="#5BB661"           # Green (Command)
export COLOR_04="#C39900"           # Yellow (Command second)
export COLOR_05="#3BA6F5"           # Blue (Path)
export COLOR_06="#968FF7"           # Magenta (Syntax var)
export COLOR_07="#00BAAA"           # Cyan (Prompt)
export COLOR_08="#CECECE"           # White

export COLOR_09="#8F8F8F"           # Bright Black
export COLOR_10="#FF9890"           # Bright Red (Command error)
export COLOR_11="#7BD77F"           # Bright Green (Exec)
export COLOR_12="#E3B831"           # Bright Yellow
export COLOR_13="#6FC6FF"           # Bright Blue (Folder)
export COLOR_14="#B5B2FF"           # Bright Magenta
export COLOR_15="#00DCCA"           # Bright Cyan
export COLOR_16="#DEDEDE"           # Bright White

export BACKGROUND_COLOR="#161616"   # Background
export FOREGROUND_COLOR="#CECECE"   # Foreground (Text)

export CURSOR_COLOR="#CECECE" # Cursor

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
