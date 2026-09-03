#!/usr/bin/env bash

export PROFILE_NAME="Ultra Violent"

export COLOR_01="#242728"           # Black (Host)
export COLOR_02="#FF0090"           # Red (Syntax string)
export COLOR_03="#B6FF00"           # Green (Command)
export COLOR_04="#FFF727"           # Yellow (Command second)
export COLOR_05="#47E0FB"           # Blue (Path)
export COLOR_06="#D731FF"           # Magenta (Syntax var)
export COLOR_07="#0EFFBB"           # Cyan (Prompt)
export COLOR_08="#E1E1E1"           # White

export COLOR_09="#636667"           # Bright Black
export COLOR_10="#FB58B4"           # Bright Red (Command error)
export COLOR_11="#DEFF8C"           # Bright Green (Exec)
export COLOR_12="#EBE087"           # Bright Yellow
export COLOR_13="#7FECFF"           # Bright Blue (Folder)
export COLOR_14="#E681FF"           # Bright Magenta
export COLOR_15="#69FCD3"           # Bright Cyan
export COLOR_16="#F9F9F5"           # Bright White

export BACKGROUND_COLOR="#242728"   # Background
export FOREGROUND_COLOR="#C1C1C1"   # Foreground (Text)

export CURSOR_COLOR="#C1C1C1" # Cursor

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
