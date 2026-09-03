#!/usr/bin/env bash

export PROFILE_NAME="GitHub Dark Dimmed"

export COLOR_01="#545D68"           # Black (Host)
export COLOR_02="#F47067"           # Red (Syntax string)
export COLOR_03="#57AB5A"           # Green (Command)
export COLOR_04="#C69026"           # Yellow (Command second)
export COLOR_05="#539BF5"           # Blue (Path)
export COLOR_06="#B083F0"           # Magenta (Syntax var)
export COLOR_07="#39C5CF"           # Cyan (Prompt)
export COLOR_08="#909DAB"           # White

export COLOR_09="#636E7B"           # Bright Black
export COLOR_10="#FF938A"           # Bright Red (Command error)
export COLOR_11="#6BC46D"           # Bright Green (Exec)
export COLOR_12="#DAAA3F"           # Bright Yellow
export COLOR_13="#6CB6FF"           # Bright Blue (Folder)
export COLOR_14="#DCBDFB"           # Bright Magenta
export COLOR_15="#56D4DD"           # Bright Cyan
export COLOR_16="#CDD9E5"           # Bright White

export BACKGROUND_COLOR="#22272E"   # Background
export FOREGROUND_COLOR="#ADBAC7"   # Foreground (Text)

export CURSOR_COLOR="#539BF5" # Cursor

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
