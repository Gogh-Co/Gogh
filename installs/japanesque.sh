#!/usr/bin/env bash

export PROFILE_NAME="Japanesque"

export COLOR_01="#343935"           # Black (Host)
export COLOR_02="#CF3F61"           # Red (Syntax string)
export COLOR_03="#7BB75B"           # Green (Command)
export COLOR_04="#E9B32A"           # Yellow (Command second)
export COLOR_05="#4C9AD4"           # Blue (Path)
export COLOR_06="#A57FC4"           # Magenta (Syntax var)
export COLOR_07="#389AAD"           # Cyan (Prompt)
export COLOR_08="#FAFAF6"           # White

export COLOR_09="#595B59"           # Bright Black
export COLOR_10="#D18FA6"           # Bright Red (Command error)
export COLOR_11="#767F2C"           # Bright Green (Exec)
export COLOR_12="#78592F"           # Bright Yellow
export COLOR_13="#135979"           # Bright Blue (Folder)
export COLOR_14="#604291"           # Bright Magenta
export COLOR_15="#76BBCA"           # Bright Cyan
export COLOR_16="#B2B5AE"           # Bright White

export BACKGROUND_COLOR="#1E1E1E"   # Background
export FOREGROUND_COLOR="#F7F6EC"   # Foreground (Text)

export CURSOR_COLOR="#F7F6EC" # Cursor

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
