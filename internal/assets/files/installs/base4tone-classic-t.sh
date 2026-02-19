#!/usr/bin/env bash

export PROFILE_NAME="Base4Tone Classic T"

export COLOR_01="#201d20"           # Black (Host)
export COLOR_02="#ce672c"           # Red (Syntax string)
export COLOR_03="#9263e3"           # Green (Command)
export COLOR_04="#b792f6"           # Yellow (Command second)
export COLOR_05="#db75eb"           # Blue (Path)
export COLOR_06="#e96396"           # Magenta (Syntax var)
export COLOR_07="#a57af0"           # Cyan (Prompt)
export COLOR_08="#ede8ed"           # White

export COLOR_09="#0c070d"           # Bright Black
export COLOR_10="#e78b55"           # Bright Red (Command error)
export COLOR_11="#c0a1f7"           # Bright Green (Exec)
export COLOR_12="#d6c2fa"           # Bright Yellow
export COLOR_13="#f1c3f8"           # Bright Blue (Folder)
export COLOR_14="#f17eaa"           # Bright Magenta
export COLOR_15="#edb1f6"           # Bright Cyan
export COLOR_16="#f8f6f9"           # Bright White

export BACKGROUND_COLOR="#201d20"   # Background
export FOREGROUND_COLOR="#9d949e"   # Foreground (Text)

export CURSOR_COLOR="#797481" # Cursor

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
