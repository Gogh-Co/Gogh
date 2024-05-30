#!/usr/bin/env bash

export PROFILE_NAME="Peppermint"

export COLOR_01="#353535"           # Black (Host)
export COLOR_02="#E64569"           # Red (Syntax string)
export COLOR_03="#89D287"           # Green (Command)
export COLOR_04="#DAB752"           # Yellow (Command second)
export COLOR_05="#439ECF"           # Blue (Path)
export COLOR_06="#D961DC"           # Magenta (Syntax var)
export COLOR_07="#64AAAF"           # Cyan (Prompt)
export COLOR_08="#B3B3B3"           # White

export COLOR_09="#535353"           # Bright Black
export COLOR_10="#E4859A"           # Bright Red (Command error)
export COLOR_11="#A2CCA1"           # Bright Green (Exec)
export COLOR_12="#E1E387"           # Bright Yellow
export COLOR_13="#6FBBE2"           # Bright Blue (Folder)
export COLOR_14="#E586E7"           # Bright Magenta
export COLOR_15="#96DCDA"           # Bright Cyan
export COLOR_16="#DEDEDE"           # Bright White

export BACKGROUND_COLOR="#000000"   # Background
export FOREGROUND_COLOR="#C7C7C7"   # Foreground (Text)

export CURSOR_COLOR="#BBBBBB" # Cursor

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
