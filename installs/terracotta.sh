#!/usr/bin/env bash

export PROFILE_NAME="Terracotta"

export COLOR_01="#EFEAE8"           # Black (Host)
export COLOR_02="#A75045"           # Red (Syntax string)
export COLOR_03="#7A894A"           # Green (Command)
export COLOR_04="#CE943E"           # Yellow (Command second)
export COLOR_05="#625574"           # Blue (Path)
export COLOR_06="#8D5968"           # Magenta (Syntax var)
export COLOR_07="#847F9E"           # Cyan (Prompt)
export COLOR_08="#473731"           # White

export COLOR_09="#C0ACA4"           # Bright Black
export COLOR_10="#A75045"           # Bright Red (Command error)
export COLOR_11="#7A894A"           # Bright Green (Exec)
export COLOR_12="#CE943E"           # Bright Yellow
export COLOR_13="#625574"           # Bright Blue (Folder)
export COLOR_14="#8D5968"           # Bright Magenta
export COLOR_15="#847F9E"           # Bright Cyan
export COLOR_16="#241C19"           # Bright White

export BACKGROUND_COLOR="#EFEAE8"   # Background
export FOREGROUND_COLOR="#473731"   # Foreground (Text)

export CURSOR_COLOR="#473731" # Cursor

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
