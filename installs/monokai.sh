#!/usr/bin/env bash

export PROFILE_NAME="Monokai"

export COLOR_01="#272822"           # Black (Host)
export COLOR_02="#F92672"           # Red (Syntax string)
export COLOR_03="#A6E22E"           # Green (Command)
export COLOR_04="#E6DB74"           # Yellow (Command second)
export COLOR_05="#FD971F"           # Blue (Path)
export COLOR_06="#AE81FF"           # Magenta (Syntax var)
export COLOR_07="#66D9EF"           # Cyan (Prompt)
export COLOR_08="#FDFFF1"           # White

export COLOR_09="#6E7066"           # Bright Black
export COLOR_10="#F92672"           # Bright Red (Command error)
export COLOR_11="#A6E22E"           # Bright Green (Exec)
export COLOR_12="#E6DB74"           # Bright Yellow
export COLOR_13="#FD971F"           # Bright Blue (Folder)
export COLOR_14="#AE81FF"           # Bright Magenta
export COLOR_15="#66D9EF"           # Bright Cyan
export COLOR_16="#FDFFF1"           # Bright White

export BACKGROUND_COLOR="#272822"   # Background
export FOREGROUND_COLOR="#FDFFF1"   # Foreground (Text)

export CURSOR_COLOR="#C0C1B5" # Cursor

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
