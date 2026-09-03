#!/usr/bin/env bash

export PROFILE_NAME="Ghostty Default Style Dark"

export COLOR_01="#1D1F21"           # Black (Host)
export COLOR_02="#BF6B69"           # Red (Syntax string)
export COLOR_03="#B7BD73"           # Green (Command)
export COLOR_04="#E9C880"           # Yellow (Command second)
export COLOR_05="#88A1BB"           # Blue (Path)
export COLOR_06="#AD95B8"           # Magenta (Syntax var)
export COLOR_07="#95BDB7"           # Cyan (Prompt)
export COLOR_08="#C5C8C6"           # White

export COLOR_09="#666666"           # Bright Black
export COLOR_10="#C55757"           # Bright Red (Command error)
export COLOR_11="#BCC95F"           # Bright Green (Exec)
export COLOR_12="#E1C65E"           # Bright Yellow
export COLOR_13="#83A5D6"           # Bright Blue (Folder)
export COLOR_14="#BC99D4"           # Bright Magenta
export COLOR_15="#83BEB1"           # Bright Cyan
export COLOR_16="#EAEAEA"           # Bright White

export BACKGROUND_COLOR="#292C33"   # Background
export FOREGROUND_COLOR="#FFFFFF"   # Foreground (Text)

export CURSOR_COLOR="#FFFFFF" # Cursor

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
