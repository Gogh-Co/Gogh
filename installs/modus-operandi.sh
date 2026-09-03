#!/usr/bin/env bash

export PROFILE_NAME="Modus Operandi"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#A60000"           # Red (Syntax string)
export COLOR_03="#006800"           # Green (Command)
export COLOR_04="#6F5500"           # Yellow (Command second)
export COLOR_05="#0031A9"           # Blue (Path)
export COLOR_06="#721045"           # Magenta (Syntax var)
export COLOR_07="#005E8B"           # Cyan (Prompt)
export COLOR_08="#A6A6A6"           # White

export COLOR_09="#595959"           # Bright Black
export COLOR_10="#972500"           # Bright Red (Command error)
export COLOR_11="#00663F"           # Bright Green (Exec)
export COLOR_12="#884900"           # Bright Yellow
export COLOR_13="#3548CF"           # Bright Blue (Folder)
export COLOR_14="#531AB6"           # Bright Magenta
export COLOR_15="#005F5F"           # Bright Cyan
export COLOR_16="#595959"           # Bright White

export BACKGROUND_COLOR="#FFFFFF"   # Background
export FOREGROUND_COLOR="#000000"   # Foreground (Text)

export CURSOR_COLOR="#000000" # Cursor

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
