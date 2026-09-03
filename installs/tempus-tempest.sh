#!/usr/bin/env bash

export PROFILE_NAME="Tempus Tempest"

export COLOR_01="#282B2B"           # Black (Host)
export COLOR_02="#CFC80A"           # Red (Syntax string)
export COLOR_03="#7AD97A"           # Green (Command)
export COLOR_04="#BFCC4A"           # Yellow (Command second)
export COLOR_05="#60D7CD"           # Blue (Path)
export COLOR_06="#C5C4AF"           # Magenta (Syntax var)
export COLOR_07="#8BD0BF"           # Cyan (Prompt)
export COLOR_08="#B0C8CA"           # White

export COLOR_09="#323535"           # Bright Black
export COLOR_10="#D1D933"           # Bright Red (Command error)
export COLOR_11="#99E299"           # Bright Green (Exec)
export COLOR_12="#BBDE4F"           # Bright Yellow
export COLOR_13="#74E4CD"           # Bright Blue (Folder)
export COLOR_14="#D2D4AA"           # Bright Magenta
export COLOR_15="#9BDFC4"           # Bright Cyan
export COLOR_16="#B6E0CA"           # Bright White

export BACKGROUND_COLOR="#282B2B"   # Background
export FOREGROUND_COLOR="#B6E0CA"   # Foreground (Text)

export CURSOR_COLOR="#B6E0CA" # Cursor

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
