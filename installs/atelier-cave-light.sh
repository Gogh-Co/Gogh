#!/usr/bin/env bash

export PROFILE_NAME="Atelier Cave Light"

export COLOR_01="#EFECF4"           # Black (Host)
export COLOR_02="#BE4678"           # Red (Syntax string)
export COLOR_03="#2A9292"           # Green (Command)
export COLOR_04="#A06E3B"           # Yellow (Command second)
export COLOR_05="#576DDB"           # Blue (Path)
export COLOR_06="#955AE7"           # Magenta (Syntax var)
export COLOR_07="#398BC6"           # Cyan (Prompt)
export COLOR_08="#585260"           # White

export COLOR_09="#7E7887"           # Bright Black
export COLOR_10="#BE4678"           # Bright Red (Command error)
export COLOR_11="#2A9292"           # Bright Green (Exec)
export COLOR_12="#A06E3B"           # Bright Yellow
export COLOR_13="#576DDB"           # Bright Blue (Folder)
export COLOR_14="#955AE7"           # Bright Magenta
export COLOR_15="#398BC6"           # Bright Cyan
export COLOR_16="#19171C"           # Bright White

export BACKGROUND_COLOR="#EFECF4"   # Background
export FOREGROUND_COLOR="#585260"   # Foreground (Text)

export CURSOR_COLOR="#585260" # Cursor

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
