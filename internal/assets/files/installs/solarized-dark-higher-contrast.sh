#!/usr/bin/env bash

export PROFILE_NAME="Solarized Dark Higher Contrast"

export COLOR_01="#002831"           # Black (Host)
export COLOR_02="#D11C24"           # Red (Syntax string)
export COLOR_03="#6CBE6C"           # Green (Command)
export COLOR_04="#A57706"           # Yellow (Command second)
export COLOR_05="#2176C7"           # Blue (Path)
export COLOR_06="#C61C6F"           # Magenta (Syntax var)
export COLOR_07="#259286"           # Cyan (Prompt)
export COLOR_08="#EAE3CB"           # White

export COLOR_09="#006488"           # Bright Black
export COLOR_10="#F5163B"           # Bright Red (Command error)
export COLOR_11="#51EF84"           # Bright Green (Exec)
export COLOR_12="#B27E28"           # Bright Yellow
export COLOR_13="#178EC8"           # Bright Blue (Folder)
export COLOR_14="#E24D8E"           # Bright Magenta
export COLOR_15="#00B39E"           # Bright Cyan
export COLOR_16="#FCF4DC"           # Bright White

export BACKGROUND_COLOR="#001E27"   # Background
export FOREGROUND_COLOR="#9CC2C3"   # Foreground (Text)

export CURSOR_COLOR="#9CC2C3" # Cursor

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
