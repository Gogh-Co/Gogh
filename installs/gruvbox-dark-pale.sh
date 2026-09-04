#!/usr/bin/env bash

export PROFILE_NAME="Gruvbox Dark Pale"

export COLOR_01="#262626"           # Black (Host)
export COLOR_02="#D75F5F"           # Red (Syntax string)
export COLOR_03="#AFAF00"           # Green (Command)
export COLOR_04="#FFAF00"           # Yellow (Command second)
export COLOR_05="#83ADAD"           # Blue (Path)
export COLOR_06="#D485AD"           # Magenta (Syntax var)
export COLOR_07="#85AD85"           # Cyan (Prompt)
export COLOR_08="#DAB997"           # White

export COLOR_09="#8A8A8A"           # Bright Black
export COLOR_10="#D75F5F"           # Bright Red (Command error)
export COLOR_11="#AFAF00"           # Bright Green (Exec)
export COLOR_12="#FFAF00"           # Bright Yellow
export COLOR_13="#83ADAD"           # Bright Blue (Folder)
export COLOR_14="#D485AD"           # Bright Magenta
export COLOR_15="#85AD85"           # Bright Cyan
export COLOR_16="#EBDBB2"           # Bright White

export BACKGROUND_COLOR="#262626"   # Background
export FOREGROUND_COLOR="#DAB997"   # Foreground (Text)

export CURSOR_COLOR="#DAB997" # Cursor

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
