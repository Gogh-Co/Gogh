#!/usr/bin/env bash

export PROFILE_NAME="Operator Mono Dark"

export COLOR_01="#5A5A5A"           # Black (Host)
export COLOR_02="#CA372D"           # Red (Syntax string)
export COLOR_03="#4D7B3A"           # Green (Command)
export COLOR_04="#D4D697"           # Yellow (Command second)
export COLOR_05="#4387CF"           # Blue (Path)
export COLOR_06="#B86CB4"           # Magenta (Syntax var)
export COLOR_07="#72D5C6"           # Cyan (Prompt)
export COLOR_08="#CED4CD"           # White

export COLOR_09="#9A9B99"           # Bright Black
export COLOR_10="#C37D62"           # Bright Red (Command error)
export COLOR_11="#83D0A2"           # Bright Green (Exec)
export COLOR_12="#FDFDC5"           # Bright Yellow
export COLOR_13="#89D3F6"           # Bright Blue (Folder)
export COLOR_14="#FF2C7A"           # Bright Magenta
export COLOR_15="#82EADA"           # Bright Cyan
export COLOR_16="#FDFDF6"           # Bright White

export BACKGROUND_COLOR="#191919"   # Background
export FOREGROUND_COLOR="#C3CAC2"   # Foreground (Text)

export CURSOR_COLOR="#FCDC08" # Cursor

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
