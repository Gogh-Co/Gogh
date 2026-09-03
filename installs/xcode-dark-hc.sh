#!/usr/bin/env bash

export PROFILE_NAME="Xcode Dark hc"

export COLOR_01="#43454B"           # Black (Host)
export COLOR_02="#FF8A7A"           # Red (Syntax string)
export COLOR_03="#83C9BC"           # Green (Command)
export COLOR_04="#D9C668"           # Yellow (Command second)
export COLOR_05="#4EC4E6"           # Blue (Path)
export COLOR_06="#FF85B8"           # Magenta (Syntax var)
export COLOR_07="#CDA1FF"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#838991"           # Bright Black
export COLOR_10="#FF8A7A"           # Bright Red (Command error)
export COLOR_11="#B1FAEB"           # Bright Green (Exec)
export COLOR_12="#FFA14F"           # Bright Yellow
export COLOR_13="#6BDFFF"           # Bright Blue (Folder)
export COLOR_14="#FF85B8"           # Bright Magenta
export COLOR_15="#E5CFFF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#1F1F24"   # Background
export FOREGROUND_COLOR="#FFFFFF"   # Foreground (Text)

export CURSOR_COLOR="#FFFFFF" # Cursor

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
