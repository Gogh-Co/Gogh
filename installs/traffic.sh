#!/usr/bin/env bash

export PROFILE_NAME="traffic"

export COLOR_01="#292D31"           # Black (Host)
export COLOR_02="#8A5249"           # Red (Syntax string)
export COLOR_03="#667269"           # Green (Command)
export COLOR_04="#C1A088"           # Yellow (Command second)
export COLOR_05="#535E66"           # Blue (Path)
export COLOR_06="#6E605E"           # Magenta (Syntax var)
export COLOR_07="#606E7C"           # Cyan (Prompt)
export COLOR_08="#CBBAAA"           # White

export COLOR_09="#434A50"           # Bright Black
export COLOR_10="#8A5249"           # Bright Red (Command error)
export COLOR_11="#667270"           # Bright Green (Exec)
export COLOR_12="#C1A088"           # Bright Yellow
export COLOR_13="#535E66"           # Bright Blue (Folder)
export COLOR_14="#6E605E"           # Bright Magenta
export COLOR_15="#606E7C"           # Bright Cyan
export COLOR_16="#DACFC3"           # Bright White

export BACKGROUND_COLOR="#282C30"   # Background
export FOREGROUND_COLOR="#CBBAAA"   # Foreground (Text)

export CURSOR_COLOR="#CBBAAA" # Cursor

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
