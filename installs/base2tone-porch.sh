#!/usr/bin/env bash

export PROFILE_NAME="Base2Tone Porch"

export COLOR_01="#221e24"           # Black (Host)
export COLOR_02="#9466a3"           # Red (Syntax string)
export COLOR_03="#f39b68"           # Green (Command)
export COLOR_04="#ffc29e"           # Yellow (Command second)
export COLOR_05="#a77cb6"           # Blue (Path)
export COLOR_06="#f39b68"           # Magenta (Syntax var)
export COLOR_07="#ba95c6"           # Cyan (Prompt)
export COLOR_08="#9f95a3"           # White

export COLOR_09="#645a68"           # Bright Black
export COLOR_10="#f8aa7c"           # Bright Red (Command error)
export COLOR_11="#302a32"           # Bright Green (Exec)
export COLOR_12="#574e5a"           # Bright Yellow
export COLOR_13="#716774"           # Bright Blue (Folder)
export COLOR_14="#dfcbe6"           # Bright Magenta
export COLOR_15="#ec8d55"           # Bright Cyan
export COLOR_16="#f2e3f7"           # Bright White

export BACKGROUND_COLOR="#221e24"   # Background
export FOREGROUND_COLOR="#9f95a3"   # Foreground (Text)

export CURSOR_COLOR="#c46731" # Cursor

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
