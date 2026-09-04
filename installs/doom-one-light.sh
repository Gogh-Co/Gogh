#!/usr/bin/env bash

export PROFILE_NAME="Doom One Light"

export COLOR_01="#383A42"           # Black (Host)
export COLOR_02="#E45649"           # Red (Syntax string)
export COLOR_03="#50A14F"           # Green (Command)
export COLOR_04="#986801"           # Yellow (Command second)
export COLOR_05="#4078F2"           # Blue (Path)
export COLOR_06="#A626A4"           # Magenta (Syntax var)
export COLOR_07="#005478"           # Cyan (Prompt)
export COLOR_08="#F0F0F0"           # White

export COLOR_09="#C6C7C7"           # Bright Black
export COLOR_10="#E45649"           # Bright Red (Command error)
export COLOR_11="#50A14F"           # Bright Green (Exec)
export COLOR_12="#986801"           # Bright Yellow
export COLOR_13="#4078F2"           # Bright Blue (Folder)
export COLOR_14="#B751B6"           # Bright Magenta
export COLOR_15="#0184BC"           # Bright Cyan
export COLOR_16="#383A42"           # Bright White

export BACKGROUND_COLOR="#FAFAFA"   # Background
export FOREGROUND_COLOR="#383A42"   # Foreground (Text)

export CURSOR_COLOR="#383A42" # Cursor

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
