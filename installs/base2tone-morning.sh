#!/usr/bin/env bash

export PROFILE_NAME="Base2Tone Morning"

export COLOR_01="#232834"           # Black (Host)
export COLOR_02="#1659DF"           # Red (Syntax string)
export COLOR_03="#B29762"           # Green (Command)
export COLOR_04="#E5DDCD"           # Yellow (Command second)
export COLOR_05="#3D75E6"           # Blue (Path)
export COLOR_06="#B29762"           # Magenta (Syntax var)
export COLOR_07="#728FCB"           # Cyan (Prompt)
export COLOR_08="#8D95A5"           # White

export COLOR_09="#656E81"           # Bright Black
export COLOR_10="#C6B28B"           # Bright Red (Command error)
export COLOR_11="#31363F"           # Bright Green (Exec)
export COLOR_12="#4F5664"           # Bright Yellow
export COLOR_13="#707A8F"           # Bright Blue (Folder)
export COLOR_14="#B7C9EB"           # Bright Magenta
export COLOR_15="#9A7C42"           # Bright Cyan
export COLOR_16="#DEE6F7"           # Bright White

export BACKGROUND_COLOR="#232834"   # Background
export FOREGROUND_COLOR="#8D95A5"   # Foreground (Text)

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
