#!/usr/bin/env bash

export PROFILE_NAME="Kanagawa Lotus"

export COLOR_01="#1F1F28"           # Black (Host)
export COLOR_02="#C84053"           # Red (Syntax string)
export COLOR_03="#6F894E"           # Green (Command)
export COLOR_04="#77713F"           # Yellow (Command second)
export COLOR_05="#4D699B"           # Blue (Path)
export COLOR_06="#B35B79"           # Magenta (Syntax var)
export COLOR_07="#597B75"           # Cyan (Prompt)
export COLOR_08="#545464"           # White

export COLOR_09="#8A8980"           # Bright Black
export COLOR_10="#D7474B"           # Bright Red (Command error)
export COLOR_11="#6E915F"           # Bright Green (Exec)
export COLOR_12="#836F4A"           # Bright Yellow
export COLOR_13="#6693BF"           # Bright Blue (Folder)
export COLOR_14="#624C83"           # Bright Magenta
export COLOR_15="#5E857A"           # Bright Cyan
export COLOR_16="#43436C"           # Bright White

export BACKGROUND_COLOR="#F2ECBC"   # Background
export FOREGROUND_COLOR="#545464"   # Foreground (Text)

export CURSOR_COLOR="#43436C" # Cursor

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
