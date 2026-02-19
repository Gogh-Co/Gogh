#!/usr/bin/env bash

export PROFILE_NAME="Nanosecond"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#FF0000"           # Red (Syntax string)
export COLOR_03="#00AA00"           # Green (Command)
export COLOR_04="#FFAA00"           # Yellow (Command second)
export COLOR_05="#00AAFF"           # Blue (Path)
export COLOR_06="#FF00FF"           # Magenta (Syntax var)
export COLOR_07="#00AAAA"           # Cyan (Prompt)
export COLOR_08="#AAAAAA"           # White

export COLOR_09="#555555"           # Bright Black
export COLOR_10="#FF5555"           # Bright Red (Command error)
export COLOR_11="#80FF80"           # Bright Green (Exec)
export COLOR_12="#FFFF80"           # Bright Yellow
export COLOR_13="#AACCFF"           # Bright Blue (Folder)
export COLOR_14="#FFAAFF"           # Bright Magenta
export COLOR_15="#80FFFF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#112233"   # Background
export FOREGROUND_COLOR="#FAFAFA"   # Foreground (Text)

export CURSOR_COLOR="#FAFAFA" # Cursor

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
