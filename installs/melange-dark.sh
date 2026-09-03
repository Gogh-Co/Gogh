#!/usr/bin/env bash

export PROFILE_NAME="Melange Dark"

export COLOR_01="#34302C"           # Black (Host)
export COLOR_02="#BD8183"           # Red (Syntax string)
export COLOR_03="#78997A"           # Green (Command)
export COLOR_04="#E49B5D"           # Yellow (Command second)
export COLOR_05="#7F91B2"           # Blue (Path)
export COLOR_06="#B380B0"           # Magenta (Syntax var)
export COLOR_07="#7B9695"           # Cyan (Prompt)
export COLOR_08="#C1A78E"           # White

export COLOR_09="#867462"           # Bright Black
export COLOR_10="#D47766"           # Bright Red (Command error)
export COLOR_11="#85B695"           # Bright Green (Exec)
export COLOR_12="#EBC06D"           # Bright Yellow
export COLOR_13="#A3A9CE"           # Bright Blue (Folder)
export COLOR_14="#CF9BC2"           # Bright Magenta
export COLOR_15="#89B3B6"           # Bright Cyan
export COLOR_16="#ECE1D7"           # Bright White

export BACKGROUND_COLOR="#292522"   # Background
export FOREGROUND_COLOR="#ECE1D7"   # Foreground (Text)

export CURSOR_COLOR="#ECE1D7" # Cursor

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
