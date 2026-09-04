#!/usr/bin/env bash

export PROFILE_NAME="Chinoiserie"

export COLOR_01="#FFFFFF"           # Black (Host)
export COLOR_02="#C04851"           # Red (Syntax string)
export COLOR_03="#428675"           # Green (Command)
export COLOR_04="#D6A01D"           # Yellow (Command second)
export COLOR_05="#815C94"           # Blue (Path)
export COLOR_06="#C08EAF"           # Magenta (Syntax var)
export COLOR_07="#2B73AF"           # Cyan (Prompt)
export COLOR_08="#4A4035"           # White

export COLOR_09="#80766E"           # Bright Black
export COLOR_10="#C04851"           # Bright Red (Command error)
export COLOR_11="#428675"           # Bright Green (Exec)
export COLOR_12="#D6A01D"           # Bright Yellow
export COLOR_13="#815C94"           # Bright Blue (Folder)
export COLOR_14="#C08EAF"           # Bright Magenta
export COLOR_15="#2B73AF"           # Bright Cyan
export COLOR_16="#131124"           # Bright White

export BACKGROUND_COLOR="#FFFFFF"   # Background
export FOREGROUND_COLOR="#4A4035"   # Foreground (Text)

export CURSOR_COLOR="#4A4035" # Cursor

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
