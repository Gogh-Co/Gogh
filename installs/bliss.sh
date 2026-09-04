#!/usr/bin/env bash

export PROFILE_NAME="Bliss"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#FF6F8D"           # Red (Syntax string)
export COLOR_03="#93FF8D"           # Green (Command)
export COLOR_04="#FFFC9B"           # Yellow (Command second)
export COLOR_05="#A198FF"           # Blue (Path)
export COLOR_06="#FF95DF"           # Magenta (Syntax var)
export COLOR_07="#95DFFF"           # Cyan (Prompt)
export COLOR_08="#C7C7C7"           # White

export COLOR_09="#676767"           # Bright Black
export COLOR_10="#FF7894"           # Bright Red (Command error)
export COLOR_11="#9AFF95"           # Bright Green (Exec)
export COLOR_12="#FFFDA9"           # Bright Yellow
export COLOR_13="#AEA6FF"           # Bright Blue (Folder)
export COLOR_14="#FFA2E3"           # Bright Magenta
export COLOR_15="#A5DEF7"           # Bright Cyan
export COLOR_16="#FEFFFF"           # Bright White

export BACKGROUND_COLOR="#16181F"   # Background
export FOREGROUND_COLOR="#EAEAEA"   # Foreground (Text)

export CURSOR_COLOR="#EAEAEA" # Cursor

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
