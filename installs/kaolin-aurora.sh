#!/usr/bin/env bash

export PROFILE_NAME="Kaolin Aurora"

export COLOR_01="#14191E"           # Black (Host)
export COLOR_02="#E55C7A"           # Red (Syntax string)
export COLOR_03="#31E183"           # Green (Command)
export COLOR_04="#F5C791"           # Yellow (Command second)
export COLOR_05="#4CA6E8"           # Blue (Path)
export COLOR_06="#9D81BA"           # Magenta (Syntax var)
export COLOR_07="#49BDB0"           # Cyan (Prompt)
export COLOR_08="#E6E6E8"           # White

export COLOR_09="#454459"           # Bright Black
export COLOR_10="#CD5C60"           # Bright Red (Command error)
export COLOR_11="#7CF083"           # Bright Green (Exec)
export COLOR_12="#DBAC66"           # Bright Yellow
export COLOR_13="#91B9C7"           # Bright Blue (Folder)
export COLOR_14="#6E6884"           # Bright Magenta
export COLOR_15="#0D9C94"           # Bright Cyan
export COLOR_16="#F2F2F2"           # Bright White

export BACKGROUND_COLOR="#14191E"   # Background
export FOREGROUND_COLOR="#E6E6E8"   # Foreground (Text)

export CURSOR_COLOR="#E6E6E8" # Cursor

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
