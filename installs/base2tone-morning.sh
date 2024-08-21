#!/usr/bin/env bash

export PROFILE_NAME="Base2Tone Morning"

export COLOR_01="#232834"           # Black (Host)
export COLOR_02="#1659df"           # Red (Syntax string)
export COLOR_03="#b29762"           # Green (Command)
export COLOR_04="#e5ddcd"           # Yellow (Command second)
export COLOR_05="#3d75e6"           # Blue (Path)
export COLOR_06="#b29762"           # Magenta (Syntax var)
export COLOR_07="#728fcb"           # Cyan (Prompt)
export COLOR_08="#8d95a5"           # White

export COLOR_09="#656e81"           # Bright Black
export COLOR_10="#c6b28b"           # Bright Red (Command error)
export COLOR_11="#31363f"           # Bright Green (Exec)
export COLOR_12="#4f5664"           # Bright Yellow
export COLOR_13="#707a8f"           # Bright Blue (Folder)
export COLOR_14="#b7c9eb"           # Bright Magenta
export COLOR_15="#9a7c42"           # Bright Cyan
export COLOR_16="#dee6f7"           # Bright White

export BACKGROUND_COLOR="#232834"   # Background
export FOREGROUND_COLOR="#8d95a5"   # Foreground (Text)

export CURSOR_COLOR="#594212" # Cursor

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
