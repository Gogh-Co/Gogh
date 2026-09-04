#!/usr/bin/env bash

export PROFILE_NAME="Wood"

export COLOR_01="#161616"           # Black (Host)
export COLOR_02="#D00016"           # Red (Syntax string)
export COLOR_03="#7BBB00"           # Green (Command)
export COLOR_04="#F5EC00"           # Yellow (Command second)
export COLOR_05="#6644CC"           # Blue (Path)
export COLOR_06="#9D1650"           # Magenta (Syntax var)
export COLOR_07="#55AAFF"           # Cyan (Prompt)
export COLOR_08="#C8CCCD"           # White

export COLOR_09="#7A7A7A"           # Bright Black
export COLOR_10="#FF6481"           # Bright Red (Command error)
export COLOR_11="#BDE271"           # Bright Green (Exec)
export COLOR_12="#EEEE88"           # Bright Yellow
export COLOR_13="#BBAAFF"           # Bright Blue (Folder)
export COLOR_14="#E372D9"           # Bright Magenta
export COLOR_15="#55EEFF"           # Bright Cyan
export COLOR_16="#FEFFFF"           # Bright White

export BACKGROUND_COLOR="#331401"   # Background
export FOREGROUND_COLOR="#FFFBCA"   # Foreground (Text)

export CURSOR_COLOR="#FFFBCA" # Cursor

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
