#!/usr/bin/env bash

export PROFILE_NAME="Firefox Dev"

export COLOR_01="#002831"           # Black (Host)
export COLOR_02="#E63853"           # Red (Syntax string)
export COLOR_03="#5EB83C"           # Green (Command)
export COLOR_04="#A57706"           # Yellow (Command second)
export COLOR_05="#359DDF"           # Blue (Path)
export COLOR_06="#D75CFF"           # Magenta (Syntax var)
export COLOR_07="#4B73A2"           # Cyan (Prompt)
export COLOR_08="#DCDCDC"           # White

export COLOR_09="#001E27"           # Bright Black
export COLOR_10="#E1003F"           # Bright Red (Command error)
export COLOR_11="#1D9000"           # Bright Green (Exec)
export COLOR_12="#CD9409"           # Bright Yellow
export COLOR_13="#006FC0"           # Bright Blue (Folder)
export COLOR_14="#A200DA"           # Bright Magenta
export COLOR_15="#005794"           # Bright Cyan
export COLOR_16="#E2E2E2"           # Bright White

export BACKGROUND_COLOR="#0E1011"   # Background
export FOREGROUND_COLOR="#7C8FA4"   # Foreground (Text)

export CURSOR_COLOR="#708284" # Cursor

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
