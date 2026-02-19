#!/usr/bin/env bash

export PROFILE_NAME="Modus Operandi"

export COLOR_01="#ffffff"           # Black (Host)
export COLOR_02="#a60000"           # Red (Syntax string)
export COLOR_03="#006800"           # Green (Command)
export COLOR_04="#6f5500"           # Yellow (Command second)
export COLOR_05="#0031a9"           # Blue (Path)
export COLOR_06="#721045"           # Magenta (Syntax var)
export COLOR_07="#005e8b"           # Cyan (Prompt)
export COLOR_08="#000000"           # White

export COLOR_09="#f2f2f2"           # Bright Black
export COLOR_10="#d00000"           # Bright Red (Command error)
export COLOR_11="#008900"           # Bright Green (Exec)
export COLOR_12="#808000"           # Bright Yellow
export COLOR_13="#0000ff"           # Bright Blue (Folder)
export COLOR_14="#dd22dd"           # Bright Magenta
export COLOR_15="#008899"           # Bright Cyan
export COLOR_16="#595959"           # Bright White

export BACKGROUND_COLOR="#ffffff"   # Background
export FOREGROUND_COLOR="#000000"   # Foreground (Text)

export CURSOR_COLOR="#000000" # Cursor

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
