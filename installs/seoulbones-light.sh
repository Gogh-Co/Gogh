#!/usr/bin/env bash

export PROFILE_NAME="Seoulbones Light"

export COLOR_01="#E2E2E2"           # Black (Host)
export COLOR_02="#DC5284"           # Red (Syntax string)
export COLOR_03="#628562"           # Green (Command)
export COLOR_04="#C48562"           # Yellow (Command second)
export COLOR_05="#0084A3"           # Blue (Path)
export COLOR_06="#896788"           # Magenta (Syntax var)
export COLOR_07="#008586"           # Cyan (Prompt)
export COLOR_08="#555555"           # White

export COLOR_09="#BFBABB"           # Bright Black
export COLOR_10="#BE3C6D"           # Bright Red (Command error)
export COLOR_11="#487249"           # Bright Green (Exec)
export COLOR_12="#A76B48"           # Bright Yellow
export COLOR_13="#006F89"           # Bright Blue (Folder)
export COLOR_14="#7F4C7E"           # Bright Magenta
export COLOR_15="#006F70"           # Bright Cyan
export COLOR_16="#777777"           # Bright White

export BACKGROUND_COLOR="#E2E2E2"   # Background
export FOREGROUND_COLOR="#555555"   # Foreground (Text)

export CURSOR_COLOR="#555555" # Cursor

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
