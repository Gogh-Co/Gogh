#!/usr/bin/env bash

export PROFILE_NAME="Venom"

export COLOR_01="#2E3436"           # Black (Host)
export COLOR_02="#E94759"           # Red (Syntax string)
export COLOR_03="#9ECFA2"           # Green (Command)
export COLOR_04="#F3EFA9"           # Yellow (Command second)
export COLOR_05="#00898D"           # Blue (Path)
export COLOR_06="#9C21B0"           # Magenta (Syntax var)
export COLOR_07="#06989A"           # Cyan (Prompt)
export COLOR_08="#D3D7CF"           # White

export COLOR_09="#555753"           # Bright Black
export COLOR_10="#EF2929"           # Bright Red (Command error)
export COLOR_11="#8AE234"           # Bright Green (Exec)
export COLOR_12="#FCE94F"           # Bright Yellow
export COLOR_13="#729FCF"           # Bright Blue (Folder)
export COLOR_14="#AD7FA8"           # Bright Magenta
export COLOR_15="#34E2E2"           # Bright Cyan
export COLOR_16="#EEEEEC"           # Bright White

export BACKGROUND_COLOR="#060D14"   # Background
export FOREGROUND_COLOR="#668198"   # Foreground (Text)

export CURSOR_COLOR="#668198" # Cursor

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
