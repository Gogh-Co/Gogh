#!/usr/bin/env bash

export PROFILE_NAME="Material Design Colors"

export COLOR_01="#435B67"           # Black (Host)
export COLOR_02="#FC3841"           # Red (Syntax string)
export COLOR_03="#5CF19E"           # Green (Command)
export COLOR_04="#FED032"           # Yellow (Command second)
export COLOR_05="#37B6FF"           # Blue (Path)
export COLOR_06="#FC226E"           # Magenta (Syntax var)
export COLOR_07="#59FFD1"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#A1B0B8"           # Bright Black
export COLOR_10="#FC746D"           # Bright Red (Command error)
export COLOR_11="#ADF7BE"           # Bright Green (Exec)
export COLOR_12="#FEE16C"           # Bright Yellow
export COLOR_13="#70CFFF"           # Bright Blue (Folder)
export COLOR_14="#FC669B"           # Bright Magenta
export COLOR_15="#9AFFE6"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#1D262A"   # Background
export FOREGROUND_COLOR="#E7EBED"   # Foreground (Text)

export CURSOR_COLOR="#EAEAEA" # Cursor

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
