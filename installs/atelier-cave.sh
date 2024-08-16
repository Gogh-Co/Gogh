#!/usr/bin/env bash

export PROFILE_NAME="Atelier Cave"

export COLOR_01="#BE4678"           # Black (Host)
export COLOR_02="#BE4678"           # Red (Syntax string)
export COLOR_03="#2A9292"           # Green (Command)
export COLOR_04="#A06E3B"           # Yellow (Command second)
export COLOR_05="#576DDB"           # Blue (Path)
export COLOR_06="#BF40BF"           # Magenta (Syntax var)
export COLOR_07="#398BC6"           # Cyan (Prompt)
export COLOR_08="#E2DFE7"           # White

export COLOR_09="#655F6D"           # Bright Black
export COLOR_10="#AA573C"           # Bright Red (Command error)
export COLOR_11="#2A9292"           # Bright Green (Exec)
export COLOR_12="#A06E3B"           # Bright Yellow
export COLOR_13="#955AE7"           # Bright Blue (Folder)
export COLOR_14="#BF40BF"           # Bright Magenta
export COLOR_15="#398BC6"           # Bright Cyan
export COLOR_16="#EFECF4"           # Bright White

export BACKGROUND_COLOR="#19171C"   # Background
export FOREGROUND_COLOR="#7E7887"   # Foreground (Text)

export CURSOR_COLOR="#7E7887" # Cursor

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
