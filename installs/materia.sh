#!/usr/bin/env bash

export PROFILE_NAME="Materia"

export COLOR_01="#263238"           # Black (Host)
export COLOR_02="#EC5F67"           # Red (Syntax string)
export COLOR_03="#8BD649"           # Green (Command)
export COLOR_04="#FFCC00"           # Yellow (Command second)
export COLOR_05="#89DDFF"           # Blue (Path)
export COLOR_06="#82AAFF"           # Magenta (Syntax var)
export COLOR_07="#80CBC4"           # Cyan (Prompt)
export COLOR_08="#CDD3DE"           # White

export COLOR_09="#707880"           # Bright Black
export COLOR_10="#EC5F67"           # Bright Red (Command error)
export COLOR_11="#8BD649"           # Bright Green (Exec)
export COLOR_12="#FFCC00"           # Bright Yellow
export COLOR_13="#89DDFF"           # Bright Blue (Folder)
export COLOR_14="#82AAFF"           # Bright Magenta
export COLOR_15="#80CBC4"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#263238"   # Background
export FOREGROUND_COLOR="#CDD3DE"   # Foreground (Text)

export CURSOR_COLOR="#CDD3DE" # Cursor

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
