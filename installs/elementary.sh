#!/usr/bin/env bash

export PROFILE_NAME="Elementary"

export COLOR_01="#242424"           # Black (Host)
export COLOR_02="#D71C15"           # Red (Syntax string)
export COLOR_03="#5AA513"           # Green (Command)
export COLOR_04="#FDB40C"           # Yellow (Command second)
export COLOR_05="#063B8C"           # Blue (Path)
export COLOR_06="#E40038"           # Magenta (Syntax var)
export COLOR_07="#2595E1"           # Cyan (Prompt)
export COLOR_08="#EFEFEF"           # White

export COLOR_09="#4B4B4B"           # Bright Black
export COLOR_10="#FC1C18"           # Bright Red (Command error)
export COLOR_11="#6BC219"           # Bright Green (Exec)
export COLOR_12="#FEC80E"           # Bright Yellow
export COLOR_13="#0955FF"           # Bright Blue (Folder)
export COLOR_14="#FB0050"           # Bright Magenta
export COLOR_15="#3EA8FC"           # Bright Cyan
export COLOR_16="#8C00EC"           # Bright White

export BACKGROUND_COLOR="#181818"   # Background
export FOREGROUND_COLOR="#EFEFEF"   # Foreground (Text)

export CURSOR_COLOR="#BBBBBB" # Cursor

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
