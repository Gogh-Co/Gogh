#!/usr/bin/env bash

export PROFILE_NAME="Maia"

export COLOR_01="#232423"           # Black (Host)
export COLOR_02="#BA2922"           # Red (Syntax string)
export COLOR_03="#7E807E"           # Green (Command)
export COLOR_04="#4C4F4D"           # Yellow (Command second)
export COLOR_05="#16A085"           # Blue (Path)
export COLOR_06="#43746A"           # Magenta (Syntax var)
export COLOR_07="#00CCCC"           # Cyan (Prompt)
export COLOR_08="#E0E0E0"           # White

export COLOR_09="#282928"           # Bright Black
export COLOR_10="#CC372C"           # Bright Red (Command error)
export COLOR_11="#8D8F8D"           # Bright Green (Exec)
export COLOR_12="#4E524F"           # Bright Yellow
export COLOR_13="#13BF9D"           # Bright Blue (Folder)
export COLOR_14="#487D72"           # Bright Magenta
export COLOR_15="#00D1D1"           # Bright Cyan
export COLOR_16="#E8E8E8"           # Bright White

export BACKGROUND_COLOR="#31363B"   # Background
export FOREGROUND_COLOR="#BDC3C7"   # Foreground (Text)

export CURSOR_COLOR="#BDC3C7" # Cursor

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
