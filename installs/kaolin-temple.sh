#!/usr/bin/env bash

export PROFILE_NAME="Kaolin Temple"

export COLOR_01="#2B2B2F"           # Black (Host)
export COLOR_02="#EF6787"           # Red (Syntax string)
export COLOR_03="#47BA99"           # Green (Command)
export COLOR_04="#EED891"           # Yellow (Command second)
export COLOR_05="#4EB8CA"           # Blue (Path)
export COLOR_06="#FBAED2"           # Magenta (Syntax var)
export COLOR_07="#49BDB0"           # Cyan (Prompt)
export COLOR_08="#EEDCC1"           # White

export COLOR_09="#697375"           # Bright Black
export COLOR_10="#BA667D"           # Bright Red (Command error)
export COLOR_11="#74B09A"           # Bright Green (Exec)
export COLOR_12="#F5C791"           # Bright Yellow
export COLOR_13="#91B9C7"           # Bright Blue (Folder)
export COLOR_14="#C791AA"           # Bright Magenta
export COLOR_15="#4FA8A3"           # Bright Cyan
export COLOR_16="#BEBEC4"           # Bright White

export BACKGROUND_COLOR="#2B2B2F"   # Background
export FOREGROUND_COLOR="#EEDCC1"   # Foreground (Text)

export CURSOR_COLOR="#EEDCC1" # Cursor

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
