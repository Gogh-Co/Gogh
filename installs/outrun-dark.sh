#!/usr/bin/env bash

export PROFILE_NAME="Outrun Dark"

export COLOR_01="#00002A"           # Black (Host)
export COLOR_02="#FF4242"           # Red (Syntax string)
export COLOR_03="#59F176"           # Green (Command)
export COLOR_04="#F3E877"           # Yellow (Command second)
export COLOR_05="#66B0FF"           # Blue (Path)
export COLOR_06="#F10596"           # Magenta (Syntax var)
export COLOR_07="#0EF0F0"           # Cyan (Prompt)
export COLOR_08="#D0D0FA"           # White

export COLOR_09="#50507A"           # Bright Black
export COLOR_10="#FF4242"           # Bright Red (Command error)
export COLOR_11="#59F176"           # Bright Green (Exec)
export COLOR_12="#F3E877"           # Bright Yellow
export COLOR_13="#66B0FF"           # Bright Blue (Folder)
export COLOR_14="#F10596"           # Bright Magenta
export COLOR_15="#0EF0F0"           # Bright Cyan
export COLOR_16="#F5F5FF"           # Bright White

export BACKGROUND_COLOR="#00002A"   # Background
export FOREGROUND_COLOR="#D0D0FA"   # Foreground (Text)

export CURSOR_COLOR="#D0D0FA" # Cursor

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
