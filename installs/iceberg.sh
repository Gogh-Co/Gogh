#!/usr/bin/env bash

export PROFILE_NAME="Iceberg"

export COLOR_01="#161821"           # Black (Host)
export COLOR_02="#e27878"           # Red (Syntax string)
export COLOR_03="#b4be82"           # Green (Command)
export COLOR_04="#e2a478"           # Yellow (Command second)
export COLOR_05="#84a0c6"           # Blue (Path)
export COLOR_06="#a093c7"           # Magenta (Syntax var)
export COLOR_07="#89b8c2"           # Cyan (Prompt)
export COLOR_08="#c6c8d1"           # White

export COLOR_09="#6b7089"           # Bright Black
export COLOR_10="#e98989"           # Bright Red (Command error)
export COLOR_11="#c0ca8e"           # Bright Green (Exec)
export COLOR_12="#e9b189"           # Bright Yellow
export COLOR_13="#91acd1"           # Bright Blue (Folder)
export COLOR_14="#ada0d3"           # Bright Magenta
export COLOR_15="#95c4ce"           # Bright Cyan
export COLOR_16="#d2d4de"           # Bright White

export BACKGROUND_COLOR="#161821"   # Background
export FOREGROUND_COLOR="#c6c8d1"   # Foreground (Text)

export CURSOR_COLOR="#d2d4de" # Cursor

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
