#!/usr/bin/env bash

export PROFILE_NAME="Tomorrow Night Eighties"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#F27779"           # Red (Syntax string)
export COLOR_03="#99CC99"           # Green (Command)
export COLOR_04="#FFCC66"           # Yellow (Command second)
export COLOR_05="#6699CC"           # Blue (Path)
export COLOR_06="#CC99CC"           # Magenta (Syntax var)
export COLOR_07="#66CCCC"           # Cyan (Prompt)
export COLOR_08="#FFFEFE"           # White

export COLOR_09="#000000"           # Bright Black
export COLOR_10="#F17779"           # Bright Red (Command error)
export COLOR_11="#99CC99"           # Bright Green (Exec)
export COLOR_12="#FFCC66"           # Bright Yellow
export COLOR_13="#6699CC"           # Bright Blue (Folder)
export COLOR_14="#CC99CC"           # Bright Magenta
export COLOR_15="#66CCCC"           # Bright Cyan
export COLOR_16="#FFFEFE"           # Bright White

export BACKGROUND_COLOR="#2C2C2C"   # Background
export FOREGROUND_COLOR="#CCCCCC"   # Foreground (Text)

export CURSOR_COLOR="#CCCCCC" # Cursor

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
