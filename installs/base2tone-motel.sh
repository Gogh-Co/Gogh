#!/usr/bin/env bash

export PROFILE_NAME="Base2Tone Motel"

export COLOR_01="#242323"           # Black (Host)
export COLOR_02="#956f76"           # Red (Syntax string)
export COLOR_03="#f8917c"           # Green (Command)
export COLOR_04="#ffc8bd"           # Yellow (Command second)
export COLOR_05="#a7868b"           # Blue (Path)
export COLOR_06="#f8917c"           # Magenta (Syntax var)
export COLOR_07="#b89da2"           # Cyan (Prompt)
export COLOR_08="#a5979a"           # White

export COLOR_09="#766b6c"           # Bright Black
export COLOR_10="#ffa28f"           # Bright Red (Command error)
export COLOR_11="#373434"           # Bright Green (Exec)
export COLOR_12="#5a5354"           # Bright Yellow
export COLOR_13="#86797b"           # Bright Blue (Folder)
export COLOR_14="#dec9cc"           # Bright Magenta
export COLOR_15="#f77c64"           # Bright Cyan
export COLOR_16="#f0dbdf"           # Bright White

export BACKGROUND_COLOR="#242323"   # Background
export FOREGROUND_COLOR="#a5979a"   # Foreground (Text)

export CURSOR_COLOR="#e24f32" # Cursor

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
