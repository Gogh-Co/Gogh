#!/usr/bin/env bash

export PROFILE_NAME="Base2Tone Porch"

export COLOR_01="#221E24"           # Black (Host)
export COLOR_02="#9466A3"           # Red (Syntax string)
export COLOR_03="#F39B68"           # Green (Command)
export COLOR_04="#FFC29E"           # Yellow (Command second)
export COLOR_05="#A77CB6"           # Blue (Path)
export COLOR_06="#F39B68"           # Magenta (Syntax var)
export COLOR_07="#BA95C6"           # Cyan (Prompt)
export COLOR_08="#9F95A3"           # White

export COLOR_09="#645A68"           # Bright Black
export COLOR_10="#F8AA7C"           # Bright Red (Command error)
export COLOR_11="#302A32"           # Bright Green (Exec)
export COLOR_12="#574E5A"           # Bright Yellow
export COLOR_13="#716774"           # Bright Blue (Folder)
export COLOR_14="#DFCBE6"           # Bright Magenta
export COLOR_15="#EC8D55"           # Bright Cyan
export COLOR_16="#F2E3F7"           # Bright White

export BACKGROUND_COLOR="#221E24"   # Background
export FOREGROUND_COLOR="#9F95A3"   # Foreground (Text)

export CURSOR_COLOR="#C46731" # Cursor

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
