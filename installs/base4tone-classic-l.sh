#!/usr/bin/env bash

export PROFILE_NAME="Base4Tone Classic L"

export COLOR_01="#1B2221"           # Black (Host)
export COLOR_02="#7667E4"           # Red (Syntax string)
export COLOR_03="#0DA51F"           # Green (Command)
export COLOR_04="#2BDA3F"           # Yellow (Command second)
export COLOR_05="#1CC4AE"           # Blue (Path)
export COLOR_06="#659EFB"           # Magenta (Syntax var)
export COLOR_07="#22BF34"           # Cyan (Prompt)
export COLOR_08="#E8EEED"           # White

export COLOR_09="#070D0C"           # Bright Black
export COLOR_10="#A095F3"           # Bright Red (Command error)
export COLOR_11="#3CDD4F"           # Bright Green (Exec)
export COLOR_12="#97EDA1"           # Bright Yellow
export COLOR_13="#ADF0E7"           # Bright Blue (Folder)
export COLOR_14="#88B4FC"           # Bright Magenta
export COLOR_15="#93ECE0"           # Bright Cyan
export COLOR_16="#F6F9F8"           # Bright White

export BACKGROUND_COLOR="#1B2221"   # Background
export FOREGROUND_COLOR="#8EA4A1"   # Foreground (Text)

export CURSOR_COLOR="#748176" # Cursor

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
