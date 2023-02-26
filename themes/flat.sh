#!/usr/bin/env bash

export PROFILE_NAME="Flat"

export COLOR_01="#2C3E50"           # Black (Host)
export COLOR_02="#C0392B"           # Red (Syntax string)
export COLOR_03="#27AE60"           # Green (Command)
export COLOR_04="#F39C12"           # Yellow (Command second)
export COLOR_05="#2980B9"           # Blue (Path)
export COLOR_06="#8E44AD"           # Magenta (Syntax var)
export COLOR_07="#16A085"           # Cyan (Prompt)
export COLOR_08="#BDC3C7"           # White

export COLOR_09="#34495E"           # Bright Black
export COLOR_10="#E74C3C"           # Bright Red (Command error)
export COLOR_11="#2ECC71"           # Bright Green (Exec)
export COLOR_12="#F1C40F"           # Bright Yellow
export COLOR_13="#3498DB"           # Bright Blue (Folder)
export COLOR_14="#9B59B6"           # Bright Magenta
export COLOR_15="#2AA198"           # Bright Cyan
export COLOR_16="#ECF0F1"           # Bright White

export BACKGROUND_COLOR="#1F2D3A"   # Background
export FOREGROUND_COLOR="#1ABC9C"   # Foreground (Text)

export CURSOR_COLOR="#1ABC9C" # Cursor

# | ===========================================================================
# | Apply Colors
# | ===========================================================================
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

# Allow developer to change url to forked url for easier testing
# IMPORTANT: Make sure you export this variable if your main shell is not bash
BASE_URL=${BASE_URL:-"https://raw.githubusercontent.com/Gogh-Co/Gogh/master"}


if [[ -e "${PARENT_PATH}/apply-colors.sh" ]]; then
  bash "${PARENT_PATH}/apply-colors.sh"
else
  if [[ "$(uname)" = "Darwin" ]]; then
    # OSX ships with curl and ancient bash
    bash -c "$(curl -so- "${BASE_URL}/apply-colors.sh")"
  else
    # Linux ships with wget
    bash -c "$(wget -qO- "${BASE_URL}/apply-colors.sh")"
  fi
fi
