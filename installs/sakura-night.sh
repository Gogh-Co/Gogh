#!/usr/bin/env bash

export PROFILE_NAME="Sakura Night"

export COLOR_01="#181425"           # Black (Host)
export COLOR_02="#E43B44"           # Red (Syntax string)
export COLOR_03="#3E8948"           # Green (Command)
export COLOR_04="#FEAE34"           # Yellow (Command second)
export COLOR_05="#124E89"           # Blue (Path)
export COLOR_06="#B55088"           # Magenta (Syntax var)
export COLOR_07="#008080"           # Cyan (Prompt)
export COLOR_08="#C0CBDC"           # White

export COLOR_09="#262B44"           # Bright Black
export COLOR_10="#FF0044"           # Bright Red (Command error)
export COLOR_11="#63C74D"           # Bright Green (Exec)
export COLOR_12="#FEE761"           # Bright Yellow
export COLOR_13="#0099DB"           # Bright Blue (Folder)
export COLOR_14="#F06292"           # Bright Magenta
export COLOR_15="#66B2B2"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#181425"   # Background
export FOREGROUND_COLOR="#F06292"   # Foreground (Text)

export CURSOR_COLOR="#F06292" # Cursor

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
