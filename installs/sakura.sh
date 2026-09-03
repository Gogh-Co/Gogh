#!/usr/bin/env bash

export PROFILE_NAME="Sakura"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#D52370"           # Red (Syntax string)
export COLOR_03="#41AF1A"           # Green (Command)
export COLOR_04="#BC7053"           # Yellow (Command second)
export COLOR_05="#6964AB"           # Blue (Path)
export COLOR_06="#C71FBF"           # Magenta (Syntax var)
export COLOR_07="#939393"           # Cyan (Prompt)
export COLOR_08="#998EAC"           # White

export COLOR_09="#786D69"           # Bright Black
export COLOR_10="#F41D99"           # Bright Red (Command error)
export COLOR_11="#22E529"           # Bright Green (Exec)
export COLOR_12="#F59574"           # Bright Yellow
export COLOR_13="#9892F1"           # Bright Blue (Folder)
export COLOR_14="#E90CDD"           # Bright Magenta
export COLOR_15="#EEEEEE"           # Bright Cyan
export COLOR_16="#CBB6FF"           # Bright White

export BACKGROUND_COLOR="#18131E"   # Background
export FOREGROUND_COLOR="#DD7BDC"   # Foreground (Text)

export CURSOR_COLOR="#FF65FD" # Cursor

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
