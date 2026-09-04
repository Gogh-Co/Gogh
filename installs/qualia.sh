#!/usr/bin/env bash

export PROFILE_NAME="Qualia"

export COLOR_01="#101010"           # Black (Host)
export COLOR_02="#EFA6A2"           # Red (Syntax string)
export COLOR_03="#80C990"           # Green (Command)
export COLOR_04="#E6A3DC"           # Yellow (Command second)
export COLOR_05="#50CACD"           # Blue (Path)
export COLOR_06="#E0AF85"           # Magenta (Syntax var)
export COLOR_07="#C8C874"           # Cyan (Prompt)
export COLOR_08="#C0C0C0"           # White

export COLOR_09="#454545"           # Bright Black
export COLOR_10="#EFA6A2"           # Bright Red (Command error)
export COLOR_11="#80C990"           # Bright Green (Exec)
export COLOR_12="#E6A3DC"           # Bright Yellow
export COLOR_13="#50CACD"           # Bright Blue (Folder)
export COLOR_14="#E0AF85"           # Bright Magenta
export COLOR_15="#C8C874"           # Bright Cyan
export COLOR_16="#454545"           # Bright White

export BACKGROUND_COLOR="#101010"   # Background
export FOREGROUND_COLOR="#C0C0C0"   # Foreground (Text)

export CURSOR_COLOR="#C0C0C0" # Cursor

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
