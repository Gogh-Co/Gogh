#!/usr/bin/env bash

export PROFILE_NAME="Rebecca"

export COLOR_01="#12131E"           # Black (Host)
export COLOR_02="#DD7755"           # Red (Syntax string)
export COLOR_03="#04DBB5"           # Green (Command)
export COLOR_04="#F2E7B7"           # Yellow (Command second)
export COLOR_05="#7AA5FF"           # Blue (Path)
export COLOR_06="#BF9CF9"           # Magenta (Syntax var)
export COLOR_07="#56D3C2"           # Cyan (Prompt)
export COLOR_08="#E4E3E9"           # White

export COLOR_09="#666699"           # Bright Black
export COLOR_10="#FF92CD"           # Bright Red (Command error)
export COLOR_11="#01EAC0"           # Bright Green (Exec)
export COLOR_12="#FFFCA8"           # Bright Yellow
export COLOR_13="#69C0FA"           # Bright Blue (Folder)
export COLOR_14="#C17FF8"           # Bright Magenta
export COLOR_15="#8BFDE1"           # Bright Cyan
export COLOR_16="#F4F2F9"           # Bright White

export BACKGROUND_COLOR="#292A44"   # Background
export FOREGROUND_COLOR="#E8E6ED"   # Foreground (Text)

export CURSOR_COLOR="#B89BF9" # Cursor

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
