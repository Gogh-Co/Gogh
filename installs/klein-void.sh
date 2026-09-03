#!/usr/bin/env bash

export PROFILE_NAME="Klein Void"

export COLOR_01="#1A1C24"           # Black (Host)
export COLOR_02="#F09890"           # Red (Syntax string)
export COLOR_03="#A6C080"           # Green (Command)
export COLOR_04="#E8BC75"           # Yellow (Command second)
export COLOR_05="#002FA7"           # Blue (Path)
export COLOR_06="#D49BB5"           # Magenta (Syntax var)
export COLOR_07="#9FC0E5"           # Cyan (Prompt)
export COLOR_08="#CDC7B8"           # White

export COLOR_09="#92907A"           # Bright Black
export COLOR_10="#D97757"           # Bright Red (Command error)
export COLOR_11="#BCC89C"           # Bright Green (Exec)
export COLOR_12="#F0C880"           # Bright Yellow
export COLOR_13="#A8BEF0"           # Bright Blue (Folder)
export COLOR_14="#C8B4D4"           # Bright Magenta
export COLOR_15="#B0D0ED"           # Bright Cyan
export COLOR_16="#F5EFDE"           # Bright White

export BACKGROUND_COLOR="#0B0D14"   # Background
export FOREGROUND_COLOR="#EDE6D3"   # Foreground (Text)

export CURSOR_COLOR="#EDE6D3" # Cursor

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
