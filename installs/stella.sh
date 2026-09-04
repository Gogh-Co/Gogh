#!/usr/bin/env bash

export PROFILE_NAME="Stella"

export COLOR_01="#2B213C"           # Black (Host)
export COLOR_02="#C79987"           # Red (Syntax string)
export COLOR_03="#ACC79B"           # Green (Command)
export COLOR_04="#C7C691"           # Yellow (Command second)
export COLOR_05="#A5AAD4"           # Blue (Path)
export COLOR_06="#C594FF"           # Magenta (Syntax var)
export COLOR_07="#9BC7BF"           # Cyan (Prompt)
export COLOR_08="#998BAD"           # White

export COLOR_09="#655978"           # Bright Black
export COLOR_10="#C79987"           # Bright Red (Command error)
export COLOR_11="#ACC79B"           # Bright Green (Exec)
export COLOR_12="#C7C691"           # Bright Yellow
export COLOR_13="#A5AAD4"           # Bright Blue (Folder)
export COLOR_14="#C594FF"           # Bright Magenta
export COLOR_15="#9BC7BF"           # Bright Cyan
export COLOR_16="#EBDCFF"           # Bright White

export BACKGROUND_COLOR="#2B213C"   # Background
export FOREGROUND_COLOR="#998BAD"   # Foreground (Text)

export CURSOR_COLOR="#998BAD" # Cursor

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
