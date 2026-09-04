#!/usr/bin/env bash

export PROFILE_NAME="Penumbra Dark"

export COLOR_01="#24272B"           # Black (Host)
export COLOR_02="#CA736C"           # Red (Syntax string)
export COLOR_03="#47A477"           # Green (Command)
export COLOR_04="#8D9741"           # Yellow (Command second)
export COLOR_05="#5794D0"           # Blue (Path)
export COLOR_06="#9481CC"           # Magenta (Syntax var)
export COLOR_07="#00A2AF"           # Cyan (Prompt)
export COLOR_08="#BEBEBE"           # White

export COLOR_09="#636363"           # Bright Black
export COLOR_10="#CA736C"           # Bright Red (Command error)
export COLOR_11="#47A477"           # Bright Green (Exec)
export COLOR_12="#8D9741"           # Bright Yellow
export COLOR_13="#5794D0"           # Bright Blue (Folder)
export COLOR_14="#9481CC"           # Bright Magenta
export COLOR_15="#00A2AF"           # Bright Cyan
export COLOR_16="#FFFDFB"           # Bright White

export BACKGROUND_COLOR="#24272B"   # Background
export FOREGROUND_COLOR="#BEBEBE"   # Foreground (Text)

export CURSOR_COLOR="#BEBEBE" # Cursor

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
