#!/usr/bin/env bash

export PROFILE_NAME="Sweet Eliverlara"

export COLOR_01="#282C34"           # Black (Host)
export COLOR_02="#ED254E"           # Red (Syntax string)
export COLOR_03="#71F79F"           # Green (Command)
export COLOR_04="#F9DC5C"           # Yellow (Command second)
export COLOR_05="#7CB7FF"           # Blue (Path)
export COLOR_06="#C74DED"           # Magenta (Syntax var)
export COLOR_07="#00C1E4"           # Cyan (Prompt)
export COLOR_08="#DCDFE4"           # White

export COLOR_09="#282C34"           # Bright Black
export COLOR_10="#ED254E"           # Bright Red (Command error)
export COLOR_11="#71F79F"           # Bright Green (Exec)
export COLOR_12="#F9DC5C"           # Bright Yellow
export COLOR_13="#7CB7FF"           # Bright Blue (Folder)
export COLOR_14="#C74DED"           # Bright Magenta
export COLOR_15="#00C1E4"           # Bright Cyan
export COLOR_16="#DCDFE4"           # Bright White

export BACKGROUND_COLOR="#282C34"   # Background
export FOREGROUND_COLOR="#C3C7D1"   # Foreground (Text)

export CURSOR_COLOR="#C3C7D1" # Cursor

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
