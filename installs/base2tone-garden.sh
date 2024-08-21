#!/usr/bin/env bash

export PROFILE_NAME="Base2Tone Garden"

export COLOR_01="#1e1f1e"           # Black (Host)
export COLOR_02="#3fac39"           # Red (Syntax string)
export COLOR_03="#db9257"           # Green (Command)
export COLOR_04="#e0cab8"           # Yellow (Command second)
export COLOR_05="#4cb946"           # Blue (Path)
export COLOR_06="#db9257"           # Magenta (Syntax var)
export COLOR_07="#6bcc66"           # Cyan (Prompt)
export COLOR_08="#969c96"           # White

export COLOR_09="#5d605c"           # Bright Black
export COLOR_10="#dba070"           # Bright Red (Command error)
export COLOR_11="#2b2c2a"           # Bright Green (Exec)
export COLOR_12="#505350"           # Bright Yellow
export COLOR_13="#696d69"           # Bright Blue (Folder)
export COLOR_14="#b7e3b5"           # Bright Magenta
export COLOR_15="#dd843c"           # Bright Cyan
export COLOR_16="#dcf0db"           # Bright White

export BACKGROUND_COLOR="#1e1f1e"   # Background
export FOREGROUND_COLOR="#969c96"   # Foreground (Text)

export CURSOR_COLOR="#bd5d0f" # Cursor

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
