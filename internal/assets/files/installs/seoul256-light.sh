#!/usr/bin/env bash

export PROFILE_NAME="Seoul256 Light"

export COLOR_01="#4e4e4e"           # Black (Host)
export COLOR_02="#af5f5f"           # Red (Syntax string)
export COLOR_03="#5f885f"           # Green (Command)
export COLOR_04="#af8760"           # Yellow (Command second)
export COLOR_05="#5f87ae"           # Blue (Path)
export COLOR_06="#875f87"           # Magenta (Syntax var)
export COLOR_07="#5f8787"           # Cyan (Prompt)
export COLOR_08="#e4e4e4"           # White

export COLOR_09="#3a3a3a"           # Bright Black
export COLOR_10="#870100"           # Bright Red (Command error)
export COLOR_11="#005f00"           # Bright Green (Exec)
export COLOR_12="#d8865f"           # Bright Yellow
export COLOR_13="#0087af"           # Bright Blue (Folder)
export COLOR_14="#87025f"           # Bright Magenta
export COLOR_15="#008787"           # Bright Cyan
export COLOR_16="#eeeeee"           # Bright White

export BACKGROUND_COLOR="#dadada"   # Background
export FOREGROUND_COLOR="#4e4e4e"   # Foreground (Text)

export CURSOR_COLOR="#4e4e4e" # Cursor

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
