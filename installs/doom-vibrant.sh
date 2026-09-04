#!/usr/bin/env bash

export PROFILE_NAME="Doom Vibrant"

export COLOR_01="#2A2E38"           # Black (Host)
export COLOR_02="#FF665C"           # Red (Syntax string)
export COLOR_03="#7BC275"           # Green (Command)
export COLOR_04="#FCCE7B"           # Yellow (Command second)
export COLOR_05="#51AFEF"           # Blue (Path)
export COLOR_06="#C57BDB"           # Magenta (Syntax var)
export COLOR_07="#5CEFFF"           # Cyan (Prompt)
export COLOR_08="#DFDFDF"           # White

export COLOR_09="#484854"           # Bright Black
export COLOR_10="#FF665C"           # Bright Red (Command error)
export COLOR_11="#99BB66"           # Bright Green (Exec)
export COLOR_12="#ECBE7B"           # Bright Yellow
export COLOR_13="#51AFEF"           # Bright Blue (Folder)
export COLOR_14="#C678DD"           # Bright Magenta
export COLOR_15="#46D9FF"           # Bright Cyan
export COLOR_16="#BBC2CF"           # Bright White

export BACKGROUND_COLOR="#242730"   # Background
export FOREGROUND_COLOR="#BBC2CF"   # Foreground (Text)

export CURSOR_COLOR="#BBC2CF" # Cursor

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
