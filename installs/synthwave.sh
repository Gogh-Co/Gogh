#!/usr/bin/env bash

export PROFILE_NAME="Synthwave"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#F6188F"           # Red (Syntax string)
export COLOR_03="#1EBB2B"           # Green (Command)
export COLOR_04="#FDF834"           # Yellow (Command second)
export COLOR_05="#2186EC"           # Blue (Path)
export COLOR_06="#F85A21"           # Magenta (Syntax var)
export COLOR_07="#12C3E2"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#7F7094"           # Bright Black
export COLOR_10="#F841A0"           # Bright Red (Command error)
export COLOR_11="#25C141"           # Bright Green (Exec)
export COLOR_12="#FDF454"           # Bright Yellow
export COLOR_13="#2F9DED"           # Bright Blue (Folder)
export COLOR_14="#F97137"           # Bright Magenta
export COLOR_15="#19CDE6"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#000000"   # Background
export FOREGROUND_COLOR="#DAD9C7"   # Foreground (Text)

export CURSOR_COLOR="#19CDE6" # Cursor

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
