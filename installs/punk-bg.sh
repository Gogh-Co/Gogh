#!/usr/bin/env bash

export PROFILE_NAME="Punk Bg"

export COLOR_01="#2E3436"           # Black (Host)
export COLOR_02="#FD3057"           # Red (Syntax string)
export COLOR_03="#970230"           # Green (Command)
export COLOR_04="#C4A000"           # Yellow (Command second)
export COLOR_05="#3465A4"           # Blue (Path)
export COLOR_06="#510A34"           # Magenta (Syntax var)
export COLOR_07="#076A7F"           # Cyan (Prompt)
export COLOR_08="#D3D7CF"           # White

export COLOR_09="#555753"           # Bright Black
export COLOR_10="#AD0B44"           # Bright Red (Command error)
export COLOR_11="#F63D5C"           # Bright Green (Exec)
export COLOR_12="#FCE94F"           # Bright Yellow
export COLOR_13="#66BABC"           # Bright Blue (Folder)
export COLOR_14="#921E65"           # Bright Magenta
export COLOR_15="#51AAC8"           # Bright Cyan
export COLOR_16="#EEEEEC"           # Bright White

export BACKGROUND_COLOR="#0E051F"   # Background
export FOREGROUND_COLOR="#B8E5EA"   # Foreground (Text)

export CURSOR_COLOR="#3F0A29" # Cursor

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
