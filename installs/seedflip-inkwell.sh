#!/usr/bin/env bash

export PROFILE_NAME="SeedFlip Inkwell"

export COLOR_01="#050505"           # Black (Host)
export COLOR_02="#CC6666"           # Red (Syntax string)
export COLOR_03="#66CC88"           # Green (Command)
export COLOR_04="#CCBB66"           # Yellow (Command second)
export COLOR_05="#6690CC"           # Blue (Path)
export COLOR_06="#CC66CC"           # Magenta (Syntax var)
export COLOR_07="#66CCCC"           # Cyan (Prompt)
export COLOR_08="#F3F1EE"           # White

export COLOR_09="#3D3D3D"           # Bright Black
export COLOR_10="#DF9F9F"           # Bright Red (Command error)
export COLOR_11="#9FDFB5"           # Bright Green (Exec)
export COLOR_12="#DFD49F"           # Bright Yellow
export COLOR_13="#9FBADF"           # Bright Blue (Folder)
export COLOR_14="#DF9FDF"           # Bright Magenta
export COLOR_15="#9FDFDF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#0A0A0A"   # Background
export FOREGROUND_COLOR="#E8E4DF"   # Foreground (Text)

export CURSOR_COLOR="#C8B8A0" # Cursor

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
