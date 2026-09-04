#!/usr/bin/env bash

export PROFILE_NAME="Vulcan"

export COLOR_01="#041523"           # Black (Host)
export COLOR_02="#818591"           # Red (Syntax string)
export COLOR_03="#977D7C"           # Green (Command)
export COLOR_04="#ADB4B9"           # Yellow (Command second)
export COLOR_05="#977D7C"           # Blue (Path)
export COLOR_06="#9198A3"           # Magenta (Syntax var)
export COLOR_07="#977D7C"           # Cyan (Prompt)
export COLOR_08="#5B778C"           # White

export COLOR_09="#7A5759"           # Bright Black
export COLOR_10="#818591"           # Bright Red (Command error)
export COLOR_11="#977D7C"           # Bright Green (Exec)
export COLOR_12="#ADB4B9"           # Bright Yellow
export COLOR_13="#977D7C"           # Bright Blue (Folder)
export COLOR_14="#9198A3"           # Bright Magenta
export COLOR_15="#977D7C"           # Bright Cyan
export COLOR_16="#214D68"           # Bright White

export BACKGROUND_COLOR="#041523"   # Background
export FOREGROUND_COLOR="#5B778C"   # Foreground (Text)

export CURSOR_COLOR="#5B778C" # Cursor

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
