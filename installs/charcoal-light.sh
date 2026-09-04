#!/usr/bin/env bash

export PROFILE_NAME="Charcoal Light"

export COLOR_01="#CABDA0"           # Black (Host)
export COLOR_02="#382E1B"           # Red (Syntax string)
export COLOR_03="#110E06"           # Green (Command)
export COLOR_04="#110E06"           # Yellow (Command second)
export COLOR_05="#251E0F"           # Blue (Path)
export COLOR_06="#382E1B"           # Magenta (Syntax var)
export COLOR_07="#110E06"           # Cyan (Prompt)
export COLOR_08="#382E1B"           # White

export COLOR_09="#645538"           # Bright Black
export COLOR_10="#382E1B"           # Bright Red (Command error)
export COLOR_11="#110E06"           # Bright Green (Exec)
export COLOR_12="#110E06"           # Bright Yellow
export COLOR_13="#251E0F"           # Bright Blue (Folder)
export COLOR_14="#382E1B"           # Bright Magenta
export COLOR_15="#110E06"           # Bright Cyan
export COLOR_16="#BCAD8C"           # Bright White

export BACKGROUND_COLOR="#CABDA0"   # Background
export FOREGROUND_COLOR="#382E1B"   # Foreground (Text)

export CURSOR_COLOR="#382E1B" # Cursor

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
