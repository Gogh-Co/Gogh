#!/usr/bin/env bash

export PROFILE_NAME="Dimmed Monokai"

export COLOR_01="#3A3D43"           # Black (Host)
export COLOR_02="#BE3F48"           # Red (Syntax string)
export COLOR_03="#879A3B"           # Green (Command)
export COLOR_04="#C5A635"           # Yellow (Command second)
export COLOR_05="#4F76A1"           # Blue (Path)
export COLOR_06="#855C8D"           # Magenta (Syntax var)
export COLOR_07="#578FA4"           # Cyan (Prompt)
export COLOR_08="#B9BCBA"           # White

export COLOR_09="#888987"           # Bright Black
export COLOR_10="#FB001F"           # Bright Red (Command error)
export COLOR_11="#0F722F"           # Bright Green (Exec)
export COLOR_12="#C47033"           # Bright Yellow
export COLOR_13="#186DE3"           # Bright Blue (Folder)
export COLOR_14="#FB0067"           # Bright Magenta
export COLOR_15="#2E706D"           # Bright Cyan
export COLOR_16="#FDFFB9"           # Bright White

export BACKGROUND_COLOR="#1F1F1F"   # Background
export FOREGROUND_COLOR="#B9BCBA"   # Foreground (Text)

export CURSOR_COLOR="#B9BCBA" # Cursor

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
