#!/usr/bin/env bash

export PROFILE_NAME="Github Light"

export COLOR_01="#24292f"           # Black (Host)
export COLOR_02="#cf222e"           # Red (Syntax string)
export COLOR_03="#1a7f37"           # Green (Command)
export COLOR_04="#9a6700"           # Yellow (Command second)
export COLOR_05="#0969da"           # Blue (Path)
export COLOR_06="#8250df"           # Magenta (Syntax var)
export COLOR_07="#1b7c83"           # Cyan (Prompt)
export COLOR_08="#6e7781"           # White

export COLOR_09="#57606a"           # Bright Black
export COLOR_10="#a40e26"           # Bright Red (Command error)
export COLOR_11="#2da44e"           # Bright Green (Exec)
export COLOR_12="#bf8700"           # Bright Yellow
export COLOR_13="#218bff"           # Bright Blue (Folder)
export COLOR_14="#a475f9"           # Bright Magenta
export COLOR_15="#3192aa"           # Bright Cyan
export COLOR_16="#8c959f"           # Bright White

export BACKGROUND_COLOR="#f6f8fa"   # Background
export FOREGROUND_COLOR="#1f2328"   # Foreground (Text)

export CURSOR_COLOR="#1f2328" # Cursor

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
