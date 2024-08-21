#!/usr/bin/env bash

export PROFILE_NAME="Base2Tone Desert"

export COLOR_01="#292724"           # Black (Host)
export COLOR_02="#816f4b"           # Red (Syntax string)
export COLOR_03="#ec9255"           # Green (Command)
export COLOR_04="#ffb380"           # Yellow (Command second)
export COLOR_05="#957e50"           # Blue (Path)
export COLOR_06="#ec9255"           # Magenta (Syntax var)
export COLOR_07="#ac8e53"           # Cyan (Prompt)
export COLOR_08="#ada594"           # White

export COLOR_09="#7e7767"           # Bright Black
export COLOR_10="#f29d63"           # Bright Red (Command error)
export COLOR_11="#3d3a34"           # Bright Green (Exec)
export COLOR_12="#615c51"           # Bright Yellow
export COLOR_13="#908774"           # Bright Blue (Folder)
export COLOR_14="#ddcba6"           # Bright Magenta
export COLOR_15="#e58748"           # Bright Cyan
export COLOR_16="#f2ead9"           # Bright White

export BACKGROUND_COLOR="#292724"   # Background
export FOREGROUND_COLOR="#ada594"   # Foreground (Text)

export CURSOR_COLOR="#bc672f" # Cursor

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
