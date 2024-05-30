#!/usr/bin/env bash

export PROFILE_NAME="Sea Shells"

export COLOR_01="#17384C"           # Black (Host)
export COLOR_02="#D15123"           # Red (Syntax string)
export COLOR_03="#027C9B"           # Green (Command)
export COLOR_04="#FCA02F"           # Yellow (Command second)
export COLOR_05="#1E4950"           # Blue (Path)
export COLOR_06="#68D4F1"           # Magenta (Syntax var)
export COLOR_07="#50A3B5"           # Cyan (Prompt)
export COLOR_08="#DEB88D"           # White

export COLOR_09="#434B53"           # Bright Black
export COLOR_10="#D48678"           # Bright Red (Command error)
export COLOR_11="#628D98"           # Bright Green (Exec)
export COLOR_12="#FDD39F"           # Bright Yellow
export COLOR_13="#1BBCDD"           # Bright Blue (Folder)
export COLOR_14="#BBE3EE"           # Bright Magenta
export COLOR_15="#87ACB4"           # Bright Cyan
export COLOR_16="#FEE4CE"           # Bright White

export BACKGROUND_COLOR="#09141B"   # Background
export FOREGROUND_COLOR="#DEB88D"   # Foreground (Text)

export CURSOR_COLOR="#DEB88D" # Cursor

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
