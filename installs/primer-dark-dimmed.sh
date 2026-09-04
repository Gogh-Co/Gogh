#!/usr/bin/env bash

export PROFILE_NAME="Primer Dark Dimmed"

export COLOR_01="#1C2128"           # Black (Host)
export COLOR_02="#F47067"           # Red (Syntax string)
export COLOR_03="#57AB5A"           # Green (Command)
export COLOR_04="#C69026"           # Yellow (Command second)
export COLOR_05="#539BF5"           # Blue (Path)
export COLOR_06="#E275AD"           # Magenta (Syntax var)
export COLOR_07="#96D0FF"           # Cyan (Prompt)
export COLOR_08="#909DAB"           # White

export COLOR_09="#545D68"           # Bright Black
export COLOR_10="#F47067"           # Bright Red (Command error)
export COLOR_11="#57AB5A"           # Bright Green (Exec)
export COLOR_12="#C69026"           # Bright Yellow
export COLOR_13="#539BF5"           # Bright Blue (Folder)
export COLOR_14="#E275AD"           # Bright Magenta
export COLOR_15="#96D0FF"           # Bright Cyan
export COLOR_16="#CDD9E5"           # Bright White

export BACKGROUND_COLOR="#1C2128"   # Background
export FOREGROUND_COLOR="#909DAB"   # Foreground (Text)

export CURSOR_COLOR="#909DAB" # Cursor

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
