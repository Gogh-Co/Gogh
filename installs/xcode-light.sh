#!/usr/bin/env bash

export PROFILE_NAME="Xcode Light"

export COLOR_01="#B4D8FD"           # Black (Host)
export COLOR_02="#D12F1B"           # Red (Syntax string)
export COLOR_03="#3E8087"           # Green (Command)
export COLOR_04="#78492A"           # Yellow (Command second)
export COLOR_05="#0F68A0"           # Blue (Path)
export COLOR_06="#AD3DA4"           # Magenta (Syntax var)
export COLOR_07="#804FB8"           # Cyan (Prompt)
export COLOR_08="#262626"           # White

export COLOR_09="#8A99A6"           # Bright Black
export COLOR_10="#D12F1B"           # Bright Red (Command error)
export COLOR_11="#23575C"           # Bright Green (Exec)
export COLOR_12="#78492A"           # Bright Yellow
export COLOR_13="#0B4F79"           # Bright Blue (Folder)
export COLOR_14="#AD3DA4"           # Bright Magenta
export COLOR_15="#4B21B0"           # Bright Cyan
export COLOR_16="#262626"           # Bright White

export BACKGROUND_COLOR="#FFFFFF"   # Background
export FOREGROUND_COLOR="#262626"   # Foreground (Text)

export CURSOR_COLOR="#262626" # Cursor

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
