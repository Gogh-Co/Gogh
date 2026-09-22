#!/usr/bin/env bash

export PROFILE_NAME="Bogota"

export COLOR_01="#200B0A"           # Black (Host)
export COLOR_02="#FC618D"           # Red (Syntax string)
export COLOR_03="#7BD88F"           # Green (Command)
export COLOR_04="#FFED89"           # Yellow (Command second)
export COLOR_05="#47E6FF"           # Blue (Path)
export COLOR_06="#FF9999"           # Magenta (Syntax var)
export COLOR_07="#47E6FF"           # Cyan (Prompt)
export COLOR_08="#F7F1FF"           # White

export COLOR_09="#525053"           # Bright Black
export COLOR_10="#FC618D"           # Bright Red (Command error)
export COLOR_11="#7BD88F"           # Bright Green (Exec)
export COLOR_12="#FFED89"           # Bright Yellow
export COLOR_13="#47E6FF"           # Bright Blue (Folder)
export COLOR_14="#FF9999"           # Bright Magenta
export COLOR_15="#47E6FF"           # Bright Cyan
export COLOR_16="#F7F1FF"           # Bright White

export BACKGROUND_COLOR="#200B0A"   # Background
export FOREGROUND_COLOR="#F7F1FF"   # Foreground (Text)

export CURSOR_COLOR="#F7F1FF" # Cursor

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
