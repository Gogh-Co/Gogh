#!/usr/bin/env bash

export PROFILE_NAME="Toy Chest"

export COLOR_01="#2C3F58"           # Black (Host)
export COLOR_02="#BE2D26"           # Red (Syntax string)
export COLOR_03="#1A9172"           # Green (Command)
export COLOR_04="#DB8E27"           # Yellow (Command second)
export COLOR_05="#325D96"           # Blue (Path)
export COLOR_06="#8A5EDC"           # Magenta (Syntax var)
export COLOR_07="#35A08F"           # Cyan (Prompt)
export COLOR_08="#23D183"           # White

export COLOR_09="#336889"           # Bright Black
export COLOR_10="#DD5944"           # Bright Red (Command error)
export COLOR_11="#31D07B"           # Bright Green (Exec)
export COLOR_12="#E7D84B"           # Bright Yellow
export COLOR_13="#34A6DA"           # Bright Blue (Folder)
export COLOR_14="#AE6BDC"           # Bright Magenta
export COLOR_15="#42C3AE"           # Bright Cyan
export COLOR_16="#D5D5D5"           # Bright White

export BACKGROUND_COLOR="#24364B"   # Background
export FOREGROUND_COLOR="#31D07B"   # Foreground (Text)

export CURSOR_COLOR="#31D07B" # Cursor

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
