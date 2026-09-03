#!/usr/bin/env bash

export PROFILE_NAME="Base2Tone Motel"

export COLOR_01="#242323"           # Black (Host)
export COLOR_02="#956F76"           # Red (Syntax string)
export COLOR_03="#F8917C"           # Green (Command)
export COLOR_04="#FFC8BD"           # Yellow (Command second)
export COLOR_05="#A7868B"           # Blue (Path)
export COLOR_06="#F8917C"           # Magenta (Syntax var)
export COLOR_07="#B89DA2"           # Cyan (Prompt)
export COLOR_08="#A5979A"           # White

export COLOR_09="#766B6C"           # Bright Black
export COLOR_10="#FFA28F"           # Bright Red (Command error)
export COLOR_11="#373434"           # Bright Green (Exec)
export COLOR_12="#5A5354"           # Bright Yellow
export COLOR_13="#86797B"           # Bright Blue (Folder)
export COLOR_14="#DEC9CC"           # Bright Magenta
export COLOR_15="#F77C64"           # Bright Cyan
export COLOR_16="#F0DBDF"           # Bright White

export BACKGROUND_COLOR="#242323"   # Background
export FOREGROUND_COLOR="#A5979A"   # Foreground (Text)

export CURSOR_COLOR="#E24F32" # Cursor

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
