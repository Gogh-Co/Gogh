#!/usr/bin/env bash

export PROFILE_NAME="datum (light)"

export COLOR_01="#292E35"           # Black (Host)
export COLOR_02="#A24500"           # Red (Syntax string)
export COLOR_03="#007553"           # Green (Command)
export COLOR_04="#656023"           # Yellow (Command second)
export COLOR_05="#0176B8"           # Blue (Path)
export COLOR_06="#973070"           # Magenta (Syntax var)
export COLOR_07="#0D7A7F"           # Cyan (Prompt)
export COLOR_08="#CED3D9"           # White

export COLOR_09="#616A76"           # Bright Black
export COLOR_10="#976700"           # Bright Red (Command error)
export COLOR_11="#007553"           # Bright Green (Exec)
export COLOR_12="#4D3919"           # Bright Yellow
export COLOR_13="#2F516C"           # Bright Blue (Folder)
export COLOR_14="#633750"           # Bright Magenta
export COLOR_15="#154B4E"           # Bright Cyan
export COLOR_16="#E7ECF2"           # Bright White

export BACKGROUND_COLOR="#F1F6FD"   # Background
export FOREGROUND_COLOR="#292E35"   # Foreground (Text)

export CURSOR_COLOR="#973070" # Cursor

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
