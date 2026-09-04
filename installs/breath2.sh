#!/usr/bin/env bash

export PROFILE_NAME="breath2"

export COLOR_01="#0D0F11"           # Black (Host)
export COLOR_02="#C0392B"           # Red (Syntax string)
export COLOR_03="#55A649"           # Green (Command)
export COLOR_04="#FDBC4B"           # Yellow (Command second)
export COLOR_05="#3DAEE9"           # Blue (Path)
export COLOR_06="#8E44AD"           # Magenta (Syntax var)
export COLOR_07="#16A085"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#2E3439"           # Bright Black
export COLOR_10="#783228"           # Bright Red (Command error)
export COLOR_11="#32642C"           # Bright Green (Exec)
export COLOR_12="#B65619"           # Bright Yellow
export COLOR_13="#1B668F"           # Bright Blue (Folder)
export COLOR_14="#614A73"           # Bright Magenta
export COLOR_15="#186C60"           # Bright Cyan
export COLOR_16="#63686D"           # Bright White

export BACKGROUND_COLOR="#1E2229"   # Background
export FOREGROUND_COLOR="#17A88B"   # Foreground (Text)

export CURSOR_COLOR="#17A88B" # Cursor

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
