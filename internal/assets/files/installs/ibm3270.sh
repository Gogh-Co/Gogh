#!/usr/bin/env bash

export PROFILE_NAME="Ibm3270"

export COLOR_01="#222222"           # Black (Host)
export COLOR_02="#F01818"           # Red (Syntax string)
export COLOR_03="#24D830"           # Green (Command)
export COLOR_04="#F0D824"           # Yellow (Command second)
export COLOR_05="#7890F0"           # Blue (Path)
export COLOR_06="#F078D8"           # Magenta (Syntax var)
export COLOR_07="#54E4E4"           # Cyan (Prompt)
export COLOR_08="#A5A5A5"           # White

export COLOR_09="#888888"           # Bright Black
export COLOR_10="#EF8383"           # Bright Red (Command error)
export COLOR_11="#7ED684"           # Bright Green (Exec)
export COLOR_12="#EFE28B"           # Bright Yellow
export COLOR_13="#B3BFEF"           # Bright Blue (Folder)
export COLOR_14="#EFB3E3"           # Bright Magenta
export COLOR_15="#9CE2E2"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#000000"   # Background
export FOREGROUND_COLOR="#FDFDFD"   # Foreground (Text)

export CURSOR_COLOR="#FDFDFD" # Cursor

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
