#!/usr/bin/env bash

export PROFILE_NAME="Monospace Dark"

export COLOR_01="#738295"           # Black (Host)
export COLOR_02="#F76769"           # Red (Syntax string)
export COLOR_03="#17B877"           # Green (Command)
export COLOR_04="#FFA23E"           # Yellow (Command second)
export COLOR_05="#708FFF"           # Blue (Path)
export COLOR_06="#A87FFB"           # Magenta (Syntax var)
export COLOR_07="#25A6E9"           # Cyan (Prompt)
export COLOR_08="#A4AFBD"           # White

export COLOR_09="#8B98A9"           # Bright Black
export COLOR_10="#FC8F8E"           # Bright Red (Command error)
export COLOR_11="#66CE98"           # Bright Green (Exec)
export COLOR_12="#FFC26E"           # Bright Yellow
export COLOR_13="#A2B6FF"           # Bright Blue (Folder)
export COLOR_14="#C8AAFF"           # Bright Magenta
export COLOR_15="#71C2EE"           # Bright Cyan
export COLOR_16="#FAFBFE"           # Bright White

export BACKGROUND_COLOR="#10151D"   # Background
export FOREGROUND_COLOR="#A4AFBD"   # Foreground (Text)

export CURSOR_COLOR="#C8AAFF" # Cursor

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
