#!/usr/bin/env bash
# colorcli theme from https://github.com/jonasjacek/colorcli

# ====================CONFIG THIS =============================== #
export COLOR_01="#000000"          # HOST (black - system)
export COLOR_02="#D70000"          # SYNTAX_STRING (red3)
export COLOR_03="#5FAF00"          # COMMAND (Chartreuse3)
export COLOR_04="#5FAF00"          # COMMAND_COLOR2 (Chartreuse3)
export COLOR_05="#005F87"          # PATH (deepskyblue4)
export COLOR_06="#D70000"          # SYNTAX_VAR (red3)
export COLOR_07="#5F5F5F"          # PROMPT (gray37)
export COLOR_08="#E4E4E4"          # (gray89)

export COLOR_09="#5F5F5F"           # Dark gray (gray37)
export COLOR_10="#D70000"           # COMMAND_ERROR (red3)
export COLOR_11="#5F5F5F"           # EXEC (gray37)
export COLOR_12="#FFFF00"           # Light Yellow (yellow1)
export COLOR_13="#0087AF"           # Light Blue (deepskyblue3)
export COLOR_14="#0087AF"           # Light Magenta (deepskyblue3)
export COLOR_15="#0087AF"           # Light Cyan (deepskyblue3)
export COLOR_16="#FFFFFF"           # White (white - system)

export BACKGROUND_COLOR="#FFFFFF"   # Background Color
export FOREGROUND_COLOR="#005F87"   # Foreground Color (text - deepskyblue4)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export HIGHLIGHT_FG_COLOR="#0087AF" # Text color within highlight (deepskyblue3)
export HIGHLIGHT_BG_COLOR="#BCBCBC" # Highlight color (gray74)
export USE_SYS_TRANSPARENCY="false"
export PROFILE_NAME="Colorcli"
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

