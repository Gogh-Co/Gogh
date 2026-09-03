#!/usr/bin/env bash

export PROFILE_NAME="IRIX Console"

export COLOR_01="#1A1919"           # Black (Host)
export COLOR_02="#D42426"           # Red (Syntax string)
export COLOR_03="#37A327"           # Green (Command)
export COLOR_04="#C29D28"           # Yellow (Command second)
export COLOR_05="#0739E2"           # Blue (Path)
export COLOR_06="#911F9C"           # Magenta (Syntax var)
export COLOR_07="#4497DF"           # Cyan (Prompt)
export COLOR_08="#CCCCCC"           # White

export COLOR_09="#767676"           # Bright Black
export COLOR_10="#F34F59"           # Bright Red (Command error)
export COLOR_11="#45C731"           # Bright Green (Exec)
export COLOR_12="#F9F2A7"           # Bright Yellow
export COLOR_13="#4079FF"           # Bright Blue (Folder)
export COLOR_14="#C31BA2"           # Bright Magenta
export COLOR_15="#6ED7D7"           # Bright Cyan
export COLOR_16="#F2F2F2"           # Bright White

export BACKGROUND_COLOR="#0C0C0C"   # Background
export FOREGROUND_COLOR="#F2F2F2"   # Foreground (Text)

export CURSOR_COLOR="#C7C7C7" # Cursor

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
