#!/usr/bin/env bash

export PROFILE_NAME="Iceberg Light"

export COLOR_01="#DCDFE7"           # Black (Host)
export COLOR_02="#CC517A"           # Red (Syntax string)
export COLOR_03="#668E3D"           # Green (Command)
export COLOR_04="#C57339"           # Yellow (Command second)
export COLOR_05="#2D539E"           # Blue (Path)
export COLOR_06="#7759B4"           # Magenta (Syntax var)
export COLOR_07="#3F83A6"           # Cyan (Prompt)
export COLOR_08="#33374C"           # White

export COLOR_09="#8389A3"           # Bright Black
export COLOR_10="#CC3768"           # Bright Red (Command error)
export COLOR_11="#598030"           # Bright Green (Exec)
export COLOR_12="#B6662D"           # Bright Yellow
export COLOR_13="#22478E"           # Bright Blue (Folder)
export COLOR_14="#6845AD"           # Bright Magenta
export COLOR_15="#327698"           # Bright Cyan
export COLOR_16="#262A3F"           # Bright White

export BACKGROUND_COLOR="#E8E9EC"   # Background
export FOREGROUND_COLOR="#33374C"   # Foreground (Text)

export CURSOR_COLOR="#33374C" # Cursor

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
