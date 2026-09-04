#!/usr/bin/env bash

export PROFILE_NAME="Material Palenight"

export COLOR_01="#2E3436"           # Black (Host)
export COLOR_02="#FF5370"           # Red (Syntax string)
export COLOR_03="#C3E88D"           # Green (Command)
export COLOR_04="#FFCB6B"           # Yellow (Command second)
export COLOR_05="#82AAFF"           # Blue (Path)
export COLOR_06="#C792EA"           # Magenta (Syntax var)
export COLOR_07="#89DDFF"           # Cyan (Prompt)
export COLOR_08="#D3D7CF"           # White

export COLOR_09="#555753"           # Bright Black
export COLOR_10="#F07178"           # Bright Red (Command error)
export COLOR_11="#C3E88D"           # Bright Green (Exec)
export COLOR_12="#F78C6C"           # Bright Yellow
export COLOR_13="#729FCF"           # Bright Blue (Folder)
export COLOR_14="#BB80B3"           # Bright Magenta
export COLOR_15="#89DDFF"           # Bright Cyan
export COLOR_16="#EEEEEC"           # Bright White

export BACKGROUND_COLOR="#292D3E"   # Background
export FOREGROUND_COLOR="#A6ACCD"   # Foreground (Text)

export CURSOR_COLOR="#A6ACCD" # Cursor

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
