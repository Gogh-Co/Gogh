#!/usr/bin/env bash

export PROFILE_NAME="Seoulism Light"

export COLOR_01="#101114"           # Black (Host)
export COLOR_02="#C83024"           # Red (Syntax string)
export COLOR_03="#108C76"           # Green (Command)
export COLOR_04="#C46E0A"           # Yellow (Command second)
export COLOR_05="#244CC8"           # Blue (Path)
export COLOR_06="#8040D2"           # Magenta (Syntax var)
export COLOR_07="#1880B4"           # Cyan (Prompt)
export COLOR_08="#C8C8C4"           # White

export COLOR_09="#5A5C64"           # Bright Black
export COLOR_10="#E24E42"           # Bright Red (Command error)
export COLOR_11="#1EA68C"           # Bright Green (Exec)
export COLOR_12="#DE8A1E"           # Bright Yellow
export COLOR_13="#466CE2"           # Bright Blue (Folder)
export COLOR_14="#9E62E4"           # Bright Magenta
export COLOR_15="#3298CC"           # Bright Cyan
export COLOR_16="#ECECE9"           # Bright White

export BACKGROUND_COLOR="#FAFAF7"   # Background
export FOREGROUND_COLOR="#101114"   # Foreground (Text)

export CURSOR_COLOR="#808080" # Cursor

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
