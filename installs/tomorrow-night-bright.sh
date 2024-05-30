#!/usr/bin/env bash

export PROFILE_NAME="Tomorrow Night Bright"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#D54E53"           # Red (Syntax string)
export COLOR_03="#B9CA49"           # Green (Command)
export COLOR_04="#E7C547"           # Yellow (Command second)
export COLOR_05="#79A6DA"           # Blue (Path)
export COLOR_06="#C397D8"           # Magenta (Syntax var)
export COLOR_07="#70C0B1"           # Cyan (Prompt)
export COLOR_08="#FFFEFE"           # White

export COLOR_09="#000000"           # Bright Black
export COLOR_10="#D44D53"           # Bright Red (Command error)
export COLOR_11="#B9C949"           # Bright Green (Exec)
export COLOR_12="#E6C446"           # Bright Yellow
export COLOR_13="#79A6DA"           # Bright Blue (Folder)
export COLOR_14="#C396D7"           # Bright Magenta
export COLOR_15="#70C0B1"           # Bright Cyan
export COLOR_16="#FFFEFE"           # Bright White

export BACKGROUND_COLOR="#000000"   # Background
export FOREGROUND_COLOR="#E9E9E9"   # Foreground (Text)

export CURSOR_COLOR="#E9E9E9" # Cursor

# | ===========================================================================
# | Apply Colors
# | ===========================================================================
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

if [[ -e "${GOGH_APPLY_SCRIPT}" ]]; then
  bash "${GOGH_APPLY_SCRIPT}"
elif [[ -e "${PARENT_PATH}/apply-colors.sh" ]]; then
  bash "${PARENT_PATH}/apply-colors.sh"
elif [[ -e "${SCRIPT_PATH}/apply-colors.sh" ]]; then
  bash "${SCRIPT_PATH}/apply-colors.sh"
else
  printf '\n%s\n' "Error: Couldn't find apply-colors.sh"
  exit 1
fi
