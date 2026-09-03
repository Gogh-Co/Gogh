#!/usr/bin/env bash

export PROFILE_NAME="Sunset Drive"

export COLOR_01="#0A0A12"           # Black (Host)
export COLOR_02="#FF3366"           # Red (Syntax string)
export COLOR_03="#00F59B"           # Green (Command)
export COLOR_04="#FFEA00"           # Yellow (Command second)
export COLOR_05="#33A1FF"           # Blue (Path)
export COLOR_06="#FF66F6"           # Magenta (Syntax var)
export COLOR_07="#3CFFED"           # Cyan (Prompt)
export COLOR_08="#EDEDFE"           # White

export COLOR_09="#181824"           # Bright Black
export COLOR_10="#FF9A8F"           # Bright Red (Command error)
export COLOR_11="#57F8BD"           # Bright Green (Exec)
export COLOR_12="#FFFF80"           # Bright Yellow
export COLOR_13="#5A9EFF"           # Bright Blue (Folder)
export COLOR_14="#FF99FF"           # Bright Magenta
export COLOR_15="#80FFFF"           # Bright Cyan
export COLOR_16="#F8F8FF"           # Bright White

export BACKGROUND_COLOR="#0F0F19"   # Background
export FOREGROUND_COLOR="#EDEDFD"   # Foreground (Text)

export CURSOR_COLOR="#EDEDFD" # Cursor

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
