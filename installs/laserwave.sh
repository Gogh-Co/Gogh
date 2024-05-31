#!/usr/bin/env bash

export PROFILE_NAME="Laserwave"

export COLOR_01="#39243A"           # Black (Host)
export COLOR_02="#EB64B9"           # Red (Syntax string)
export COLOR_03="#AFD686"           # Green (Command)
export COLOR_04="#FEAE87"           # Yellow (Command second)
export COLOR_05="#40B4C4"           # Blue (Path)
export COLOR_06="#B381C5"           # Magenta (Syntax var)
export COLOR_07="#215969"           # Cyan (Prompt)
export COLOR_08="#91889B"           # White

export COLOR_09="#716485"           # Bright Black
export COLOR_10="#FC2377"           # Bright Red (Command error)
export COLOR_11="#50FA7B"           # Bright Green (Exec)
export COLOR_12="#FFE261"           # Bright Yellow
export COLOR_13="#74DFC4"           # Bright Blue (Folder)
export COLOR_14="#6D75E0"           # Bright Magenta
export COLOR_15="#B4DCE7"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#1F1926"   # Background
export FOREGROUND_COLOR="#E0E0E0"   # Foreground (Text)

export CURSOR_COLOR="#C7C7C7" # Cursor

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
