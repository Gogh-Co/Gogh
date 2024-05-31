#!/usr/bin/env bash

export PROFILE_NAME="Crayon Pony Fish"

export COLOR_01="#2B1B1D"           # Black (Host)
export COLOR_02="#91002B"           # Red (Syntax string)
export COLOR_03="#579524"           # Green (Command)
export COLOR_04="#AB311B"           # Yellow (Command second)
export COLOR_05="#8C87B0"           # Blue (Path)
export COLOR_06="#692F50"           # Magenta (Syntax var)
export COLOR_07="#E8A866"           # Cyan (Prompt)
export COLOR_08="#68525A"           # White

export COLOR_09="#3D2B2E"           # Bright Black
export COLOR_10="#C5255D"           # Bright Red (Command error)
export COLOR_11="#8DFF57"           # Bright Green (Exec)
export COLOR_12="#C8381D"           # Bright Yellow
export COLOR_13="#CFC9FF"           # Bright Blue (Folder)
export COLOR_14="#FC6CBA"           # Bright Magenta
export COLOR_15="#FFCEAF"           # Bright Cyan
export COLOR_16="#B0949D"           # Bright White

export BACKGROUND_COLOR="#150707"   # Background
export FOREGROUND_COLOR="#68525A"   # Foreground (Text)

export CURSOR_COLOR="#68525A" # Cursor

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
