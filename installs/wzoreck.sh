#!/usr/bin/env bash

export PROFILE_NAME="Wzoreck"

export COLOR_01="#2E3436"           # Black (Host)
export COLOR_02="#FC6386"           # Red (Syntax string)
export COLOR_03="#A9DC76"           # Green (Command)
export COLOR_04="#FCE94F"           # Yellow (Command second)
export COLOR_05="#FB976B"           # Blue (Path)
export COLOR_06="#75507B"           # Magenta (Syntax var)
export COLOR_07="#34E2E2"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#989595"           # Bright Black
export COLOR_10="#FC6386"           # Bright Red (Command error)
export COLOR_11="#A9DC76"           # Bright Green (Exec)
export COLOR_12="#FCE94F"           # Bright Yellow
export COLOR_13="#FB976B"           # Bright Blue (Folder)
export COLOR_14="#AB9DF2"           # Bright Magenta
export COLOR_15="#34E2E2"           # Bright Cyan
export COLOR_16="#D1D1C0"           # Bright White

export BACKGROUND_COLOR="#424043"   # Background
export FOREGROUND_COLOR="#FCFCFA"   # Foreground (Text)

export CURSOR_COLOR="#FCFCFA" # Cursor

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
