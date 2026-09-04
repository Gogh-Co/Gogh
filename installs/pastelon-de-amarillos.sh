#!/usr/bin/env bash

export PROFILE_NAME="Pastelon De Amarillos"

export COLOR_01="#FFF4D6"           # Black (Host)
export COLOR_02="#A63D4A"           # Red (Syntax string)
export COLOR_03="#327056"           # Green (Command)
export COLOR_04="#846600"           # Yellow (Command second)
export COLOR_05="#365F91"           # Blue (Path)
export COLOR_06="#784A78"           # Magenta (Syntax var)
export COLOR_07="#276E6C"           # Cyan (Prompt)
export COLOR_08="#432C3B"           # White

export COLOR_09="#80616B"           # Bright Black
export COLOR_10="#A86E00"           # Bright Red (Command error)
export COLOR_11="#007B78"           # Bright Green (Exec)
export COLOR_12="#007B4E"           # Bright Yellow
export COLOR_13="#9B3395"           # Bright Blue (Folder)
export COLOR_14="#87301F"           # Bright Magenta
export COLOR_15="#005EB8"           # Bright Cyan
export COLOR_16="#1C0F20"           # Bright White

export BACKGROUND_COLOR="#FFF4D6"   # Background
export FOREGROUND_COLOR="#432C3B"   # Foreground (Text)

export CURSOR_COLOR="#432C3B" # Cursor

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
