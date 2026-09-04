#!/usr/bin/env bash

export PROFILE_NAME="Farin"

export COLOR_01="#444444"           # Black (Host)
export COLOR_02="#FF1155"           # Red (Syntax string)
export COLOR_03="#11FF55"           # Green (Command)
export COLOR_04="#FFBB33"           # Yellow (Command second)
export COLOR_05="#1155FF"           # Blue (Path)
export COLOR_06="#ED53C9"           # Magenta (Syntax var)
export COLOR_07="#00FFBB"           # Cyan (Prompt)
export COLOR_08="#CCCCCC"           # White

export COLOR_09="#666666"           # Bright Black
export COLOR_10="#FF4488"           # Bright Red (Command error)
export COLOR_11="#44FF88"           # Bright Green (Exec)
export COLOR_12="#FFDD66"           # Bright Yellow
export COLOR_13="#4488FF"           # Bright Blue (Folder)
export COLOR_14="#DD66FF"           # Bright Magenta
export COLOR_15="#66FFDD"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#1E1E1E"   # Background
export FOREGROUND_COLOR="#AAAAAA"   # Foreground (Text)

export CURSOR_COLOR="#AAAAAA" # Cursor

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
