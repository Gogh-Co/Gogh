#!/usr/bin/env bash

export PROFILE_NAME="Tokyo Night Storm"

export COLOR_01="#414868"           # Black (Host)
export COLOR_02="#F7768E"           # Red (Syntax string)
export COLOR_03="#9ECE6A"           # Green (Command)
export COLOR_04="#E0AF68"           # Yellow (Command second)
export COLOR_05="#7AA2F7"           # Blue (Path)
export COLOR_06="#BB9AF7"           # Magenta (Syntax var)
export COLOR_07="#7DCFFF"           # Cyan (Prompt)
export COLOR_08="#C0CAF5"           # White

export COLOR_09="#414868"           # Bright Black
export COLOR_10="#F7768E"           # Bright Red (Command error)
export COLOR_11="#9ECE6A"           # Bright Green (Exec)
export COLOR_12="#E0AF68"           # Bright Yellow
export COLOR_13="#7AA2F7"           # Bright Blue (Folder)
export COLOR_14="#BB9AF7"           # Bright Magenta
export COLOR_15="#7DCFFF"           # Bright Cyan
export COLOR_16="#C0CAF5"           # Bright White

export BACKGROUND_COLOR="#24283B"   # Background
export FOREGROUND_COLOR="#C0CAF5"   # Foreground (Text)

export CURSOR_COLOR="#C0CAF5" # Cursor

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
