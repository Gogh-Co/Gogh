#!/usr/bin/env bash

export PROFILE_NAME="Unikitty Dark"

export COLOR_01="#2E2A31"           # Black (Host)
export COLOR_02="#D8137F"           # Red (Syntax string)
export COLOR_03="#17AD98"           # Green (Command)
export COLOR_04="#DC8A0E"           # Yellow (Command second)
export COLOR_05="#796AF5"           # Blue (Path)
export COLOR_06="#BB60EA"           # Magenta (Syntax var)
export COLOR_07="#149BDA"           # Cyan (Prompt)
export COLOR_08="#BCBABE"           # White

export COLOR_09="#838085"           # Bright Black
export COLOR_10="#D8137F"           # Bright Red (Command error)
export COLOR_11="#17AD98"           # Bright Green (Exec)
export COLOR_12="#DC8A0E"           # Bright Yellow
export COLOR_13="#796AF5"           # Bright Blue (Folder)
export COLOR_14="#BB60EA"           # Bright Magenta
export COLOR_15="#149BDA"           # Bright Cyan
export COLOR_16="#F5F4F7"           # Bright White

export BACKGROUND_COLOR="#2E2A31"   # Background
export FOREGROUND_COLOR="#BCBABE"   # Foreground (Text)

export CURSOR_COLOR="#BCBABE" # Cursor

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
