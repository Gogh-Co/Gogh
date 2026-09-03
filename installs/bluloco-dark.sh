#!/usr/bin/env bash

export PROFILE_NAME="Bluloco Dark"

export COLOR_01="#41444D"           # Black (Host)
export COLOR_02="#FC2F52"           # Red (Syntax string)
export COLOR_03="#25A45C"           # Green (Command)
export COLOR_04="#FF936A"           # Yellow (Command second)
export COLOR_05="#3476FF"           # Blue (Path)
export COLOR_06="#7A82DA"           # Magenta (Syntax var)
export COLOR_07="#4483AA"           # Cyan (Prompt)
export COLOR_08="#CDD4E0"           # White

export COLOR_09="#8F9AAE"           # Bright Black
export COLOR_10="#FF6480"           # Bright Red (Command error)
export COLOR_11="#3FC56B"           # Bright Green (Exec)
export COLOR_12="#F9C859"           # Bright Yellow
export COLOR_13="#10B1FE"           # Bright Blue (Folder)
export COLOR_14="#FF78F8"           # Bright Magenta
export COLOR_15="#5FB9BC"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#282C34"   # Background
export FOREGROUND_COLOR="#B9C0CB"   # Foreground (Text)

export CURSOR_COLOR="#FFCC00" # Cursor

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
