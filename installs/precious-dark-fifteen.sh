#!/usr/bin/env bash

export PROFILE_NAME="Precious Dark Fifteen"

export COLOR_01="#23262B"           # Black (Host)
export COLOR_02="#FF8782"           # Red (Syntax string)
export COLOR_03="#95B659"           # Green (Command)
export COLOR_04="#CFA546"           # Yellow (Command second)
export COLOR_05="#66B0EF"           # Blue (Path)
export COLOR_06="#B799FF"           # Magenta (Syntax var)
export COLOR_07="#42BDA7"           # Cyan (Prompt)
export COLOR_08="#BAB9B6"           # White

export COLOR_09="#898989"           # Bright Black
export COLOR_10="#FF8782"           # Bright Red (Command error)
export COLOR_11="#95B659"           # Bright Green (Exec)
export COLOR_12="#CFA546"           # Bright Yellow
export COLOR_13="#66B0EF"           # Bright Blue (Folder)
export COLOR_14="#B799FF"           # Bright Magenta
export COLOR_15="#42BDA7"           # Bright Cyan
export COLOR_16="#BAB9B6"           # Bright White

export BACKGROUND_COLOR="#23262B"   # Background
export FOREGROUND_COLOR="#BAB9B6"   # Foreground (Text)

export CURSOR_COLOR="#BAB9B6" # Cursor

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
