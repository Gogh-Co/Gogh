#!/usr/bin/env bash

export PROFILE_NAME="Tempus Autumn"

export COLOR_01="#302420"           # Black (Host)
export COLOR_02="#f46f55"           # Red (Syntax string)
export COLOR_03="#85a400"           # Green (Command)
export COLOR_04="#b09640"           # Yellow (Command second)
export COLOR_05="#799aca"           # Blue (Path)
export COLOR_06="#df798e"           # Magenta (Syntax var)
export COLOR_07="#52a885"           # Cyan (Prompt)
export COLOR_08="#a8948a"           # White

export COLOR_09="#36302a"           # Bright Black
export COLOR_10="#e27e3d"           # Bright Red (Command error)
export COLOR_11="#43aa7a"           # Bright Green (Exec)
export COLOR_12="#ba9400"           # Bright Yellow
export COLOR_13="#958fdf"           # Bright Blue (Folder)
export COLOR_14="#ce7dc4"           # Bright Magenta
export COLOR_15="#2fa6b7"           # Bright Cyan
export COLOR_16="#a9a2a6"           # Bright White

export BACKGROUND_COLOR="#302420"   # Background
export FOREGROUND_COLOR="#a9a2a6"   # Foreground (Text)

export CURSOR_COLOR="#a9a2a6" # Cursor

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
