#!/usr/bin/env bash

export PROFILE_NAME="Green Phosphor CRT"

export COLOR_01="#002200"           # Black (Host)
export COLOR_02="#00AA00"           # Red (Syntax string)
export COLOR_03="#33FF33"           # Green (Command)
export COLOR_04="#66FF66"           # Yellow (Command second)
export COLOR_05="#00CC44"           # Blue (Path)
export COLOR_06="#00FF88"           # Magenta (Syntax var)
export COLOR_07="#66FFAA"           # Cyan (Prompt)
export COLOR_08="#B6FFB6"           # White

export COLOR_09="#0A5A0A"           # Bright Black
export COLOR_10="#19CC19"           # Bright Red (Command error)
export COLOR_11="#66FF66"           # Bright Green (Exec)
export COLOR_12="#99FF99"           # Bright Yellow
export COLOR_13="#33FF77"           # Bright Blue (Folder)
export COLOR_14="#66FFAA"           # Bright Magenta
export COLOR_15="#99FFCC"           # Bright Cyan
export COLOR_16="#E6FFE6"           # Bright White

export BACKGROUND_COLOR="#0B0F0B"   # Background
export FOREGROUND_COLOR="#33FF33"   # Foreground (Text)

export CURSOR_COLOR="#33FF33" # Cursor

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
