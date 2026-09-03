#!/usr/bin/env bash

export PROFILE_NAME="Aardvark Ink"

export COLOR_01="#222734"           # Black (Host)
export COLOR_02="#C26265"           # Red (Syntax string)
export COLOR_03="#52AA60"           # Green (Command)
export COLOR_04="#AD9B49"           # Yellow (Command second)
export COLOR_05="#487FD4"           # Blue (Path)
export COLOR_06="#AF5BD1"           # Magenta (Syntax var)
export COLOR_07="#269D9A"           # Cyan (Prompt)
export COLOR_08="#5A6377"           # White

export COLOR_09="#3A4152"           # Bright Black
export COLOR_10="#E48383"           # Bright Red (Command error)
export COLOR_11="#75CF84"           # Bright Green (Exec)
export COLOR_12="#C7B461"           # Bright Yellow
export COLOR_13="#76A8F2"           # Bright Blue (Folder)
export COLOR_14="#D58BF0"           # Bright Magenta
export COLOR_15="#52C4C0"           # Bright Cyan
export COLOR_16="#DFE5EE"           # Bright White

export BACKGROUND_COLOR="#0F141F"   # Background
export FOREGROUND_COLOR="#B4BCCA"   # Foreground (Text)

export CURSOR_COLOR="#B4BCCA" # Cursor

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
