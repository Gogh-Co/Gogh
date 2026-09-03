#!/usr/bin/env bash

export PROFILE_NAME="Challenger Deep"

export COLOR_01="#141228"           # Black (Host)
export COLOR_02="#FF5458"           # Red (Syntax string)
export COLOR_03="#62D196"           # Green (Command)
export COLOR_04="#FFB378"           # Yellow (Command second)
export COLOR_05="#65B2FF"           # Blue (Path)
export COLOR_06="#906CFF"           # Magenta (Syntax var)
export COLOR_07="#63F2F1"           # Cyan (Prompt)
export COLOR_08="#A6B3CC"           # White

export COLOR_09="#565575"           # Bright Black
export COLOR_10="#FF8080"           # Bright Red (Command error)
export COLOR_11="#95FFA4"           # Bright Green (Exec)
export COLOR_12="#FFE9AA"           # Bright Yellow
export COLOR_13="#91DDFF"           # Bright Blue (Folder)
export COLOR_14="#C991E1"           # Bright Magenta
export COLOR_15="#AAFFE4"           # Bright Cyan
export COLOR_16="#CBE3E7"           # Bright White

export BACKGROUND_COLOR="#1E1C31"   # Background
export FOREGROUND_COLOR="#CBE1E7"   # Foreground (Text)

export CURSOR_COLOR="#FBFCFC" # Cursor

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
