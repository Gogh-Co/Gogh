#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#2A2A2E"           # HOST | Black russian | list-text-color | maybe
export COLOR_02="#B98EFF"           # SYNTAX_STRING | Medium purple | html-attribute-value
export COLOR_03="#FF7DE9"           # COMMAND | Orchid | html-attribute-name
export COLOR_04="#729FCF"           # COMMAND_COLOR2 | Jordy blue | html-tag
export COLOR_05="#66A05B"           # PATH | De york | html-comment and doctype
export COLOR_06="#75507B"           # SYNTAX_VAR | Hot purple (import) list-bg-color | maybe
export COLOR_07="#ACACAE"           # PROMP | Dark grey | html-tag-angle-brackets
export COLOR_08="#FFFFFF"           # White | active list-bg (probably)

export COLOR_09="#A40000"           # UNKNOWN | Tomato
export COLOR_10="#BF4040"           # COMMAND_ERROR | Valencia (grep highlight)
export COLOR_11="#66A05B"           # EXEC | same as PATH (De york) (maybe)
export COLOR_12="#FFB86C"           # UNKNOWN | Rajah
export COLOR_13="#729FCF"           # FOLDER | Jordy blue | active:html-brackets/parenthesis
export COLOR_14="#8F5902"           # Mandalay | special sort of-files (probably)
export COLOR_15="#C4A000"           # (maybe) | Lemon
export COLOR_16="#5C3566"           # UNKNOWN | Honey flower

export BACKGROUND_COLOR="#2A2A2E"   # Background Color | Black russian | true
export FOREGROUND_COLOR="#D7D7DB"   # Text | Fuscous grey | html-tag-content
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Foxnightly"
# =============================================

# Mainly inspired by firefox developer/nightly (58) inspector theme
# Font: Hack or Liberation Mono Regular | 9 (font-size)
# Allow bold text
# Cursor shape: Block or Underline (if Hack — Block else Underline)
# Show menubar by default in new terminals — turn off (unchecked)
# Bold color: Same as text color (as you wish — checked/unchecked)

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
  if [[ "$(uname)" = "Darwin" ]]; then
    # OSX ships with curl and ancient bash
    bash -c "$(curl -so- "${BASE_URL}/apply-colors.sh")"
  else
    # Linux ships with wget
    bash -c "$(wget -qO- "${BASE_URL}/apply-colors.sh")"
  fi
fi
