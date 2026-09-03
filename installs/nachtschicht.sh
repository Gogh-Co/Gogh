#!/usr/bin/env bash

export PROFILE_NAME="Nachtschicht"

export COLOR_01="#0E1012"           # Black (Host)
export COLOR_02="#E5484D"           # Red (Syntax string)
export COLOR_03="#33D17A"           # Green (Command)
export COLOR_04="#E3B341"           # Yellow (Command second)
export COLOR_05="#4D7CFE"           # Blue (Path)
export COLOR_06="#C86AD8"           # Magenta (Syntax var)
export COLOR_07="#3FC8B0"           # Cyan (Prompt)
export COLOR_08="#C9CFD6"           # White

export COLOR_09="#9DA4AF"           # Bright Black
export COLOR_10="#EF8F92"           # Bright Red (Command error)
export COLOR_11="#76E0A5"           # Bright Green (Exec)
export COLOR_12="#EDCF88"           # Bright Yellow
export COLOR_13="#9EB8FE"           # Bright Blue (Folder)
export COLOR_14="#E0ABE9"           # Bright Magenta
export COLOR_15="#7EDACA"           # Bright Cyan
export COLOR_16="#E8EAED"           # Bright White

export BACKGROUND_COLOR="#17191D"   # Background
export FOREGROUND_COLOR="#E8EAED"   # Foreground (Text)

export CURSOR_COLOR="#E3B341" # Cursor

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
