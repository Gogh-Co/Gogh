#!/usr/bin/env bash

export PROFILE_NAME="Nightfly"

export COLOR_01="#1D3B53"           # Black (Host)
export COLOR_02="#FC514E"           # Red (Syntax string)
export COLOR_03="#A1CD5E"           # Green (Command)
export COLOR_04="#E3D18A"           # Yellow (Command second)
export COLOR_05="#82AAFF"           # Blue (Path)
export COLOR_06="#C792EA"           # Magenta (Syntax var)
export COLOR_07="#7FDBCA"           # Cyan (Prompt)
export COLOR_08="#A1AAB8"           # White

export COLOR_09="#7C8F8F"           # Bright Black
export COLOR_10="#FF5874"           # Bright Red (Command error)
export COLOR_11="#21C7A8"           # Bright Green (Exec)
export COLOR_12="#ECC48D"           # Bright Yellow
export COLOR_13="#82AAFF"           # Bright Blue (Folder)
export COLOR_14="#AE81FF"           # Bright Magenta
export COLOR_15="#7FDBCA"           # Bright Cyan
export COLOR_16="#D6DEEB"           # Bright White

export BACKGROUND_COLOR="#011627"   # Background
export FOREGROUND_COLOR="#BDC1C6"   # Foreground (Text)

export CURSOR_COLOR="#9CA1AA" # Cursor

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
