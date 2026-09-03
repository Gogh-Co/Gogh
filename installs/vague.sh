#!/usr/bin/env bash

export PROFILE_NAME="Vague"

export COLOR_01="#252530"           # Black (Host)
export COLOR_02="#D8647E"           # Red (Syntax string)
export COLOR_03="#7FA563"           # Green (Command)
export COLOR_04="#F3BE7C"           # Yellow (Command second)
export COLOR_05="#6E94B2"           # Blue (Path)
export COLOR_06="#BB9DBD"           # Magenta (Syntax var)
export COLOR_07="#AEAED1"           # Cyan (Prompt)
export COLOR_08="#CDCDCD"           # White

export COLOR_09="#606079"           # Bright Black
export COLOR_10="#E08398"           # Bright Red (Command error)
export COLOR_11="#99B782"           # Bright Green (Exec)
export COLOR_12="#F5CB96"           # Bright Yellow
export COLOR_13="#8BA9C1"           # Bright Blue (Folder)
export COLOR_14="#C9B1CA"           # Bright Magenta
export COLOR_15="#BEBEDA"           # Bright Cyan
export COLOR_16="#D7D7D7"           # Bright White

export BACKGROUND_COLOR="#141415"   # Background
export FOREGROUND_COLOR="#CDCDCD"   # Foreground (Text)

export CURSOR_COLOR="#CDCDCD" # Cursor

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
