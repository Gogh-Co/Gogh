#!/usr/bin/env bash

export PROFILE_NAME="Medailion"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#B54C00"           # Red (Syntax string)
export COLOR_03="#7C8A16"           # Green (Command)
export COLOR_04="#ABB8FF"           # Yellow (Command second)
export COLOR_05="#606BAF"           # Blue (Path)
export COLOR_06="#8B5990"           # Magenta (Syntax var)
export COLOR_07="#906B25"           # Cyan (Prompt)
export COLOR_08="#C9C199"           # White

export COLOR_09="#5E5118"           # Bright Black
export COLOR_10="#FF9148"           # Bright Red (Command error)
export COLOR_11="#B1C93A"           # Bright Green (Exec)
export COLOR_12="#FFE449"           # Bright Yellow
export COLOR_13="#ABB8FF"           # Bright Blue (Folder)
export COLOR_14="#FE9FFF"           # Bright Magenta
export COLOR_15="#FFBB51"           # Bright Cyan
export COLOR_16="#FED597"           # Bright White

export BACKGROUND_COLOR="#1D1808"   # Background
export FOREGROUND_COLOR="#AEA578"   # Foreground (Text)

export CURSOR_COLOR="#AEA578" # Cursor

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
