#!/usr/bin/env bash

export PROFILE_NAME="Moonlight Ii Vscode"

export COLOR_01="#444A73"           # Black (Host)
export COLOR_02="#FF5370"           # Red (Syntax string)
export COLOR_03="#4FD6BE"           # Green (Command)
export COLOR_04="#FFC777"           # Yellow (Command second)
export COLOR_05="#3E68D7"           # Blue (Path)
export COLOR_06="#FC7B7B"           # Magenta (Syntax var)
export COLOR_07="#86E1FC"           # Cyan (Prompt)
export COLOR_08="#D0D0D0"           # White

export COLOR_09="#828BB8"           # Bright Black
export COLOR_10="#FF98A4"           # Bright Red (Command error)
export COLOR_11="#C3E88D"           # Bright Green (Exec)
export COLOR_12="#FFC777"           # Bright Yellow
export COLOR_13="#82AAFF"           # Bright Blue (Folder)
export COLOR_14="#FF966C"           # Bright Magenta
export COLOR_15="#B4F9F8"           # Bright Cyan
export COLOR_16="#5F8787"           # Bright White

export BACKGROUND_COLOR="#1E2030"   # Background
export FOREGROUND_COLOR="#7F85A3"   # Foreground (Text)

export CURSOR_COLOR="#7F85A3" # Cursor

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
