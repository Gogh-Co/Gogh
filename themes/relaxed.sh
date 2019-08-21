#!/usr/bin/env bash
# Relaxed theme from https://github.com/Relaxed-Theme

# ====================CONFIG THIS =============================== #
export COLOR_01="#151515"           # HOST 
export COLOR_02="#BC5653"           # SYNTAX_STRING 
export COLOR_03="#909D63"           # COMMAND 
export COLOR_04="#EBC17A"           # COMMAND_COLOR2 
export COLOR_05="#6A8799"           # PATH 
export COLOR_06="#B06698"           # SYNTAX_VAR 
export COLOR_07="#C9DFFF"           # PROMPT 
export COLOR_08="#D9D9D9"           # 

export COLOR_09="#636363"           # Dark gray 
export COLOR_10="#BC5653"           # COMMAND_ERROR 
export COLOR_11="#A0AC77"           # EXEC 
export COLOR_12="#EBC17A"           # Light Yellow 
export COLOR_13="#7EAAC7"           # Light Blue
export COLOR_14="#B06698"           # Light Magenta
export COLOR_15="#ACBBD0"           # Light Cyan
export COLOR_16="#F7F7F7"           # White

export BACKGROUND_COLOR="#353A44"   # Background Color
export FOREGROUND_COLOR="#D9D9D9"   # Foreground Color 
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export HIGHLIGHT_FG_COLOR="$FOREGROUND_COLOR" # Text color within highlight
export HIGHLIGHT_BG_COLOR="#6A8799" # Highlight color 
export PROFILE_NAME="Relaxed"
# =============================================================== #


# =============================================================== #
# | Apply Colors
# ===============================================================|#
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

# Allow developer to change url to forked url for easier testing
# IMPORTANT: Make sure you export this variable if your main shell is not bash
BASE_URL=${BASE_URL:-"https://raw.githubusercontent.com/Mayccoll/Gogh/master"}


if [[ -e "${PARENT_PATH}/apply-colors.sh" ]]; then
  bash "${PARENT_PATH}/apply-colors.sh"
else
  if command -v curl >/dev/null 2>&1; then
    bash -c "$(curl -so- "${BASE_URL}/apply-colors.sh")"
  elif command -v wget >/dev/null 2>&1; then
    bash -c "$(wget -qO- "${BASE_URL}/apply-colors.sh")"
  fi
fi
