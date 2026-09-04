#!/usr/bin/env bash

export PROFILE_NAME="Sick"

export COLOR_01="#2E3436"           # Black (Host)
export COLOR_02="#F47375"           # Red (Syntax string)
export COLOR_03="#6BF1BE"           # Green (Command)
export COLOR_04="#E5F081"           # Yellow (Command second)
export COLOR_05="#6AA1FD"           # Blue (Path)
export COLOR_06="#C481FF"           # Magenta (Syntax var)
export COLOR_07="#6DE4FD"           # Cyan (Prompt)
export COLOR_08="#D3D7CF"           # White

export COLOR_09="#555753"           # Bright Black
export COLOR_10="#F47375"           # Bright Red (Command error)
export COLOR_11="#6BF1BE"           # Bright Green (Exec)
export COLOR_12="#E5F081"           # Bright Yellow
export COLOR_13="#6AA1FD"           # Bright Blue (Folder)
export COLOR_14="#C481FF"           # Bright Magenta
export COLOR_15="#6DE4FD"           # Bright Cyan
export COLOR_16="#EEEEEC"           # Bright White

export BACKGROUND_COLOR="#272935"   # Background
export FOREGROUND_COLOR="#AEAEB1"   # Foreground (Text)

export CURSOR_COLOR="#AEAEB1" # Cursor

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
