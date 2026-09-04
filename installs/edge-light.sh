#!/usr/bin/env bash

export PROFILE_NAME="Edge Light"

export COLOR_01="#FAFAFA"           # Black (Host)
export COLOR_02="#DB7070"           # Red (Syntax string)
export COLOR_03="#7C9F4B"           # Green (Command)
export COLOR_04="#EBCC1A"           # Yellow (Command second)
export COLOR_05="#6587BF"           # Blue (Path)
export COLOR_06="#B870CE"           # Magenta (Syntax var)
export COLOR_07="#509C93"           # Cyan (Prompt)
export COLOR_08="#474752"           # White

export COLOR_09="#9197A1"           # Bright Black
export COLOR_10="#DB7070"           # Bright Red (Command error)
export COLOR_11="#7C9F4B"           # Bright Green (Exec)
export COLOR_12="#EBCC1A"           # Bright Yellow
export COLOR_13="#6587BF"           # Bright Blue (Folder)
export COLOR_14="#B870CE"           # Bright Magenta
export COLOR_15="#509C93"           # Bright Cyan
export COLOR_16="#2E2E38"           # Bright White

export BACKGROUND_COLOR="#FAFAFA"   # Background
export FOREGROUND_COLOR="#474752"   # Foreground (Text)

export CURSOR_COLOR="#474752" # Cursor

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
