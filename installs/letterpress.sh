#!/usr/bin/env bash

export PROFILE_NAME="Letterpress"

export COLOR_01="#3A352C"           # Black (Host)
export COLOR_02="#B0202A"           # Red (Syntax string)
export COLOR_03="#506B24"           # Green (Command)
export COLOR_04="#8A5E0A"           # Yellow (Command second)
export COLOR_05="#2A5C8A"           # Blue (Path)
export COLOR_06="#6E4B2E"           # Magenta (Syntax var)
export COLOR_07="#176B5F"           # Cyan (Prompt)
export COLOR_08="#AEABA4"           # White

export COLOR_09="#8E886F"           # Bright Black
export COLOR_10="#B0202A"           # Bright Red (Command error)
export COLOR_11="#506B24"           # Bright Green (Exec)
export COLOR_12="#8A4FA0"           # Bright Yellow
export COLOR_13="#2A5C8A"           # Bright Blue (Folder)
export COLOR_14="#176B5F"           # Bright Magenta
export COLOR_15="#176B5F"           # Bright Cyan
export COLOR_16="#3A352C"           # Bright White

export BACKGROUND_COLOR="#F3ECDF"   # Background
export FOREGROUND_COLOR="#3A352C"   # Foreground (Text)

export CURSOR_COLOR="#2A5C8A" # Cursor

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
