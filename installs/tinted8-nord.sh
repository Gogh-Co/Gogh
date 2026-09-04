#!/usr/bin/env bash

export PROFILE_NAME="tinted8 Nord"

export COLOR_01="#2E3440"           # Black (Host)
export COLOR_02="#BF616A"           # Red (Syntax string)
export COLOR_03="#A3BE8C"           # Green (Command)
export COLOR_04="#EBCB8B"           # Yellow (Command second)
export COLOR_05="#81A1C1"           # Blue (Path)
export COLOR_06="#B48EAD"           # Magenta (Syntax var)
export COLOR_07="#88C0D0"           # Cyan (Prompt)
export COLOR_08="#E5E9F0"           # White

export COLOR_09="#465165"           # Bright Black
export COLOR_10="#D18D93"           # Bright Red (Command error)
export COLOR_11="#C2D4B3"           # Bright Green (Exec)
export COLOR_12="#F4E2BF"           # Bright Yellow
export COLOR_13="#AAC0D5"           # Bright Blue (Folder)
export COLOR_14="#CCB3C8"           # Bright Magenta
export COLOR_15="#B4D7E1"           # Bright Cyan
export COLOR_16="#ECEFF4"           # Bright White

export BACKGROUND_COLOR="#2E3440"   # Background
export FOREGROUND_COLOR="#E5E9F0"   # Foreground (Text)

export CURSOR_COLOR="#E5E9F0" # Cursor

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
