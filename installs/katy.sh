#!/usr/bin/env bash

export PROFILE_NAME="Katy"

export COLOR_01="#292D3E"           # Black (Host)
export COLOR_02="#6E98E1"           # Red (Syntax string)
export COLOR_03="#78C06E"           # Green (Command)
export COLOR_04="#E0A557"           # Yellow (Command second)
export COLOR_05="#82AAFF"           # Blue (Path)
export COLOR_06="#C792EA"           # Magenta (Syntax var)
export COLOR_07="#83B7E5"           # Cyan (Prompt)
export COLOR_08="#959DCB"           # White

export COLOR_09="#676E95"           # Bright Black
export COLOR_10="#6E98E1"           # Bright Red (Command error)
export COLOR_11="#78C06E"           # Bright Green (Exec)
export COLOR_12="#E0A557"           # Bright Yellow
export COLOR_13="#82AAFF"           # Bright Blue (Folder)
export COLOR_14="#C792EA"           # Bright Magenta
export COLOR_15="#83B7E5"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#292D3E"   # Background
export FOREGROUND_COLOR="#959DCB"   # Foreground (Text)

export CURSOR_COLOR="#959DCB" # Cursor

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
