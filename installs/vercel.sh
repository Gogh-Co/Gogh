#!/usr/bin/env bash

export PROFILE_NAME="Vercel"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#FC0036"           # Red (Syntax string)
export COLOR_03="#29A948"           # Green (Command)
export COLOR_04="#FFAE00"           # Yellow (Command second)
export COLOR_05="#006AFF"           # Blue (Path)
export COLOR_06="#F32882"           # Magenta (Syntax var)
export COLOR_07="#00AC96"           # Cyan (Prompt)
export COLOR_08="#FEFFFF"           # White

export COLOR_09="#A8A8A8"           # Bright Black
export COLOR_10="#FF8080"           # Bright Red (Command error)
export COLOR_11="#4BE15D"           # Bright Green (Exec)
export COLOR_12="#FFAE00"           # Bright Yellow
export COLOR_13="#49AEFF"           # Bright Blue (Folder)
export COLOR_14="#F97EA8"           # Bright Magenta
export COLOR_15="#00E4C4"           # Bright Cyan
export COLOR_16="#FEFEFE"           # Bright White

export BACKGROUND_COLOR="#101010"   # Background
export FOREGROUND_COLOR="#FAFAFA"   # Foreground (Text)

export CURSOR_COLOR="#F32882" # Cursor

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
