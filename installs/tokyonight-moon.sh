#!/usr/bin/env bash

export PROFILE_NAME="TokyoNight Moon"

export COLOR_01="#1B1D2B"           # Black (Host)
export COLOR_02="#FF757F"           # Red (Syntax string)
export COLOR_03="#C3E88D"           # Green (Command)
export COLOR_04="#FFC777"           # Yellow (Command second)
export COLOR_05="#82AAFF"           # Blue (Path)
export COLOR_06="#C099FF"           # Magenta (Syntax var)
export COLOR_07="#86E1FC"           # Cyan (Prompt)
export COLOR_08="#828BB8"           # White

export COLOR_09="#444A73"           # Bright Black
export COLOR_10="#FF757F"           # Bright Red (Command error)
export COLOR_11="#C3E88D"           # Bright Green (Exec)
export COLOR_12="#FFC777"           # Bright Yellow
export COLOR_13="#82AAFF"           # Bright Blue (Folder)
export COLOR_14="#C099FF"           # Bright Magenta
export COLOR_15="#86E1FC"           # Bright Cyan
export COLOR_16="#C8D3F5"           # Bright White

export BACKGROUND_COLOR="#222436"   # Background
export FOREGROUND_COLOR="#C8D3F5"   # Foreground (Text)

export CURSOR_COLOR="#C8D3F5" # Cursor

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
