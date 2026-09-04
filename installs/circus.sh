#!/usr/bin/env bash

export PROFILE_NAME="Circus"

export COLOR_01="#191919"           # Black (Host)
export COLOR_02="#DC657D"           # Red (Syntax string)
export COLOR_03="#84B97C"           # Green (Command)
export COLOR_04="#C3BA63"           # Yellow (Command second)
export COLOR_05="#639EE4"           # Blue (Path)
export COLOR_06="#B888E2"           # Magenta (Syntax var)
export COLOR_07="#4BB1A7"           # Cyan (Prompt)
export COLOR_08="#A7A7A7"           # White

export COLOR_09="#5F5A60"           # Bright Black
export COLOR_10="#DC657D"           # Bright Red (Command error)
export COLOR_11="#84B97C"           # Bright Green (Exec)
export COLOR_12="#C3BA63"           # Bright Yellow
export COLOR_13="#639EE4"           # Bright Blue (Folder)
export COLOR_14="#B888E2"           # Bright Magenta
export COLOR_15="#4BB1A7"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#191919"   # Background
export FOREGROUND_COLOR="#A7A7A7"   # Foreground (Text)

export CURSOR_COLOR="#A7A7A7" # Cursor

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
