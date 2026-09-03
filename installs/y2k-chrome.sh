#!/usr/bin/env bash

export PROFILE_NAME="Y2K Chrome"

export COLOR_01="#383F4F"           # Black (Host)
export COLOR_02="#DC2626"           # Red (Syntax string)
export COLOR_03="#15803D"           # Green (Command)
export COLOR_04="#0891B2"           # Yellow (Command second)
export COLOR_05="#F97316"           # Blue (Path)
export COLOR_06="#7C3AED"           # Magenta (Syntax var)
export COLOR_07="#2563EB"           # Cyan (Prompt)
export COLOR_08="#475569"           # White

export COLOR_09="#A3B1C4"           # Bright Black
export COLOR_10="#B01E1E"           # Bright Red (Command error)
export COLOR_11="#116631"           # Bright Green (Exec)
export COLOR_12="#077792"           # Bright Yellow
export COLOR_13="#C75C12"           # Bright Blue (Folder)
export COLOR_14="#632EBE"           # Bright Magenta
export COLOR_15="#1E4FBC"           # Bright Cyan
export COLOR_16="#0F172A"           # Bright White

export BACKGROUND_COLOR="#F1F5F9"   # Background
export FOREGROUND_COLOR="#0F172A"   # Foreground (Text)

export CURSOR_COLOR="#0F172A" # Cursor

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
