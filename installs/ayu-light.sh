#!/usr/bin/env bash

export PROFILE_NAME="Ayu Light"

export COLOR_01="#575F66"           # Black (Host)
export COLOR_02="#F51818"           # Red (Syntax string)
export COLOR_03="#86B300"           # Green (Command)
export COLOR_04="#F2AE49"           # Yellow (Command second)
export COLOR_05="#399EE6"           # Blue (Path)
export COLOR_06="#A37ACC"           # Magenta (Syntax var)
export COLOR_07="#4CBF99"           # Cyan (Prompt)
export COLOR_08="#FAFAFA"           # White

export COLOR_09="#8A9199"           # Bright Black
export COLOR_10="#F51818"           # Bright Red (Command error)
export COLOR_11="#86B300"           # Bright Green (Exec)
export COLOR_12="#F2AE49"           # Bright Yellow
export COLOR_13="#399EE6"           # Bright Blue (Folder)
export COLOR_14="#A37ACC"           # Bright Magenta
export COLOR_15="#4CBF99"           # Bright Cyan
export COLOR_16="#FAFAFA"           # Bright White

export BACKGROUND_COLOR="#FAFAFA"   # Background
export FOREGROUND_COLOR="#575F66"   # Foreground (Text)

export CURSOR_COLOR="#FF9940" # Cursor

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
