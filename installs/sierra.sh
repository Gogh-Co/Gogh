#!/usr/bin/env bash

export PROFILE_NAME="Sierra"

export COLOR_01="#0E0E04"           # Black (Host)
export COLOR_02="#515A45"           # Red (Syntax string)
export COLOR_03="#68694F"           # Green (Command)
export COLOR_04="#7F7F60"           # Yellow (Command second)
export COLOR_05="#989876"           # Blue (Path)
export COLOR_06="#897C5B"           # Magenta (Syntax var)
export COLOR_07="#A18E60"           # Cyan (Prompt)
export COLOR_08="#BB7774"           # White

export COLOR_09="#A85E5D"           # Bright Black
export COLOR_10="#475A2E"           # Bright Red (Command error)
export COLOR_11="#676938"           # Bright Green (Exec)
export COLOR_12="#7F7F41"           # Bright Yellow
export COLOR_13="#98984E"           # Bright Blue (Folder)
export COLOR_14="#897645"           # Bright Magenta
export COLOR_15="#A17140"           # Bright Cyan
export COLOR_16="#C9CBAC"           # Bright White

export BACKGROUND_COLOR="#1C1A14"   # Background
export FOREGROUND_COLOR="#CACBB9"   # Foreground (Text)

export CURSOR_COLOR="#CACBB9" # Cursor

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
