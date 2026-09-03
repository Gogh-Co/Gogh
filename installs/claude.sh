#!/usr/bin/env bash

export PROFILE_NAME="Claude"

export COLOR_01="#C15F3C"           # Black (Host)
export COLOR_02="#788C5D"           # Red (Syntax string)
export COLOR_03="#B16803"           # Green (Command)
export COLOR_04="#6A9BCC"           # Yellow (Command second)
export COLOR_05="#8B6CB0"           # Blue (Path)
export COLOR_06="#2E8B8B"           # Magenta (Syntax var)
export COLOR_07="#B5B3A9"           # Cyan (Prompt)
export COLOR_08="#3D3D3C"           # White

export COLOR_09="#D97757"           # Bright Black
export COLOR_10="#8FA86B"           # Bright Red (Command error)
export COLOR_11="#D4952B"           # Bright Green (Exec)
export COLOR_12="#7BAFD4"           # Bright Yellow
export COLOR_13="#A080C8"           # Bright Blue (Folder)
export COLOR_14="#4EAAAA"           # Bright Magenta
export COLOR_15="#BAB9B5"           # Bright Cyan
export COLOR_16="#141413"           # Bright White

export BACKGROUND_COLOR="#FAF9F5"   # Background
export FOREGROUND_COLOR="#141413"   # Foreground (Text)

export CURSOR_COLOR="#D97757" # Cursor

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
