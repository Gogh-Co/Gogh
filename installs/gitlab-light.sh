#!/usr/bin/env bash

export PROFILE_NAME="GitLab Light"

export COLOR_01="#303030"           # Black (Host)
export COLOR_02="#A31700"           # Red (Syntax string)
export COLOR_03="#0A7F3D"           # Green (Command)
export COLOR_04="#AF551D"           # Yellow (Command second)
export COLOR_05="#006CD8"           # Blue (Path)
export COLOR_06="#583CAC"           # Magenta (Syntax var)
export COLOR_07="#00798A"           # Cyan (Prompt)
export COLOR_08="#303030"           # White

export COLOR_09="#303030"           # Bright Black
export COLOR_10="#A31700"           # Bright Red (Command error)
export COLOR_11="#0A7F3D"           # Bright Green (Exec)
export COLOR_12="#AF551D"           # Bright Yellow
export COLOR_13="#006CD8"           # Bright Blue (Folder)
export COLOR_14="#583CAC"           # Bright Magenta
export COLOR_15="#00798A"           # Bright Cyan
export COLOR_16="#303030"           # Bright White

export BACKGROUND_COLOR="#FAFAFF"   # Background
export FOREGROUND_COLOR="#303030"   # Foreground (Text)

export CURSOR_COLOR="#303030" # Cursor

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
