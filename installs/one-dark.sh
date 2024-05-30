#!/usr/bin/env bash

export PROFILE_NAME="One Dark"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#E06C75"           # Red (Syntax string)
export COLOR_03="#98C379"           # Green (Command)
export COLOR_04="#D19A66"           # Yellow (Command second)
export COLOR_05="#61AFEF"           # Blue (Path)
export COLOR_06="#C678DD"           # Magenta (Syntax var)
export COLOR_07="#56B6C2"           # Cyan (Prompt)
export COLOR_08="#ABB2BF"           # White

export COLOR_09="#5C6370"           # Bright Black
export COLOR_10="#E06C75"           # Bright Red (Command error)
export COLOR_11="#98C379"           # Bright Green (Exec)
export COLOR_12="#D19A66"           # Bright Yellow
export COLOR_13="#61AFEF"           # Bright Blue (Folder)
export COLOR_14="#C678DD"           # Bright Magenta
export COLOR_15="#56B6C2"           # Bright Cyan
export COLOR_16="#FFFEFE"           # Bright White

export BACKGROUND_COLOR="#1E2127"   # Background
export FOREGROUND_COLOR="#5C6370"   # Foreground (Text)

export CURSOR_COLOR="#5C6370" # Cursor

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
