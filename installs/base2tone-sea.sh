#!/usr/bin/env bash

export PROFILE_NAME="Base2Tone Sea"

export COLOR_01="#1D262F"           # Black (Host)
export COLOR_02="#34659D"           # Red (Syntax string)
export COLOR_03="#0FC78A"           # Green (Command)
export COLOR_04="#47EBB4"           # Yellow (Command second)
export COLOR_05="#57718E"           # Blue (Path)
export COLOR_06="#0FC78A"           # Magenta (Syntax var)
export COLOR_07="#6E9BCF"           # Cyan (Prompt)
export COLOR_08="#A1AAB5"           # White

export COLOR_09="#4A5F78"           # Bright Black
export COLOR_10="#14E19D"           # Bright Red (Command error)
export COLOR_11="#27323F"           # Bright Green (Exec)
export COLOR_12="#405368"           # Bright Yellow
export COLOR_13="#738191"           # Bright Blue (Folder)
export COLOR_14="#AFD4FE"           # Bright Magenta
export COLOR_15="#0DB57D"           # Bright Cyan
export COLOR_16="#EBF4FF"           # Bright White

export BACKGROUND_COLOR="#1D262F"   # Background
export FOREGROUND_COLOR="#A1AAB5"   # Foreground (Text)

export CURSOR_COLOR="#067953" # Cursor

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
