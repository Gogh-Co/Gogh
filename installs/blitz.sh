#!/usr/bin/env bash

export PROFILE_NAME="Blitz"

export COLOR_01="#2E3436"           # Black (Host)
export COLOR_02="#F70047"           # Red (Syntax string)
export COLOR_03="#00FF7D"           # Green (Command)
export COLOR_04="#FCDD42"           # Yellow (Command second)
export COLOR_05="#26B3D2"           # Blue (Path)
export COLOR_06="#B055F4"           # Magenta (Syntax var)
export COLOR_07="#FF8DB4"           # Cyan (Prompt)
export COLOR_08="#D3D7CF"           # White

export COLOR_09="#555753"           # Bright Black
export COLOR_10="#FF5555"           # Bright Red (Command error)
export COLOR_11="#55FF55"           # Bright Green (Exec)
export COLOR_12="#FFFF55"           # Bright Yellow
export COLOR_13="#729FCF"           # Bright Blue (Folder)
export COLOR_14="#FF55FF"           # Bright Magenta
export COLOR_15="#34E2E2"           # Bright Cyan
export COLOR_16="#EEEEEC"           # Bright White

export BACKGROUND_COLOR="#16141E"   # Background
export FOREGROUND_COLOR="#00ECC8"   # Foreground (Text)

export CURSOR_COLOR="#00ECC8" # Cursor

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
