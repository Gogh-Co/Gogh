#!/usr/bin/env bash

export PROFILE_NAME="Monokai SublimeText"

export COLOR_01="#333333"           # Black (Host)
export COLOR_02="#C4265E"           # Red (Syntax string)
export COLOR_03="#86B42B"           # Green (Command)
export COLOR_04="#B3B42B"           # Yellow (Command second)
export COLOR_05="#6A7EC8"           # Blue (Path)
export COLOR_06="#8C6BC8"           # Magenta (Syntax var)
export COLOR_07="#56ADBC"           # Cyan (Prompt)
export COLOR_08="#E3E3DD"           # White

export COLOR_09="#666666"           # Bright Black
export COLOR_10="#F92672"           # Bright Red (Command error)
export COLOR_11="#A6E22E"           # Bright Green (Exec)
export COLOR_12="#E2E22E"           # Bright Yellow
export COLOR_13="#819AFF"           # Bright Blue (Folder)
export COLOR_14="#AE81FF"           # Bright Magenta
export COLOR_15="#66D9EF"           # Bright Cyan
export COLOR_16="#F8F8F2"           # Bright White

export BACKGROUND_COLOR="#272822"   # Background
export FOREGROUND_COLOR="#F8F8F2"   # Foreground (Text)

export CURSOR_COLOR="#F8F8F0" # Cursor

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
