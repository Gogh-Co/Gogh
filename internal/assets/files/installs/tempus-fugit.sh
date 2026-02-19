#!/usr/bin/env bash

export PROFILE_NAME="Tempus Fugit"

export COLOR_01="#4d595f"           # Black (Host)
export COLOR_02="#c61a14"           # Red (Syntax string)
export COLOR_03="#357200"           # Green (Command)
export COLOR_04="#825e00"           # Yellow (Command second)
export COLOR_05="#1666b0"           # Blue (Path)
export COLOR_06="#a83884"           # Magenta (Syntax var)
export COLOR_07="#007072"           # Cyan (Prompt)
export COLOR_08="#efe6e4"           # White

export COLOR_09="#796271"           # Bright Black
export COLOR_10="#b93f1a"           # Bright Red (Command error)
export COLOR_11="#437520"           # Bright Green (Exec)
export COLOR_12="#985900"           # Bright Yellow
export COLOR_13="#485adf"           # Bright Blue (Folder)
export COLOR_14="#a234c0"           # Bright Magenta
export COLOR_15="#00756a"           # Bright Cyan
export COLOR_16="#fff5f3"           # Bright White

export BACKGROUND_COLOR="#fff5f3"   # Background
export FOREGROUND_COLOR="#4d595f"   # Foreground (Text)

export CURSOR_COLOR="#4d595f" # Cursor

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
