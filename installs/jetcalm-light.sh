#!/usr/bin/env bash

export PROFILE_NAME="JetCalm Light"

export COLOR_01="#383A42"           # Black (Host)
export COLOR_02="#A52A2A"           # Red (Syntax string)
export COLOR_03="#556B2F"           # Green (Command)
export COLOR_04="#5C3E00"           # Yellow (Command second)
export COLOR_05="#4682B4"           # Blue (Path)
export COLOR_06="#A626A4"           # Magenta (Syntax var)
export COLOR_07="#0997B3"           # Cyan (Prompt)
export COLOR_08="#6B8E23"           # White

export COLOR_09="#4F525D"           # Bright Black
export COLOR_10="#DF6C75"           # Bright Red (Command error)
export COLOR_11="#2E8B57"           # Bright Green (Exec)
export COLOR_12="#808000"           # Bright Yellow
export COLOR_13="#008080"           # Bright Blue (Folder)
export COLOR_14="#C577DD"           # Bright Magenta
export COLOR_15="#008080"           # Bright Cyan
export COLOR_16="#7B8D9E"           # Bright White

export BACKGROUND_COLOR="#EDEDED"   # Background
export FOREGROUND_COLOR="#1C2410"   # Foreground (Text)

export CURSOR_COLOR="#082108" # Cursor

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
