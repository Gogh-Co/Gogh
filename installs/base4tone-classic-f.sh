#!/usr/bin/env bash

export PROFILE_NAME="Base4Tone Classic F"

export COLOR_01="#1F211C"           # Black (Host)
export COLOR_02="#0B88D0"           # Red (Syntax string)
export COLOR_03="#A48F04"           # Green (Command)
export COLOR_04="#DCC218"           # Yellow (Command second)
export COLOR_05="#8BCF17"           # Blue (Path)
export COLOR_06="#15BC52"           # Magenta (Syntax var)
export COLOR_07="#C1AA15"           # Cyan (Prompt)
export COLOR_08="#EBEEE8"           # White

export COLOR_09="#0B0D07"           # Bright Black
export COLOR_10="#47B5F5"           # Bright Red (Command error)
export COLOR_11="#E6CA1A"           # Bright Green (Exec)
export COLOR_12="#F2E58C"           # Bright Yellow
export COLOR_13="#DDF6B1"           # Bright Blue (Folder)
export COLOR_14="#18D85E"           # Bright Magenta
export COLOR_15="#CDF28C"           # Bright Cyan
export COLOR_16="#F8F9F6"           # Bright White

export BACKGROUND_COLOR="#1F211C"   # Background
export FOREGROUND_COLOR="#9BA191"   # Foreground (Text)

export CURSOR_COLOR="#85826F" # Cursor

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
