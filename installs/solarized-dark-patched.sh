#!/usr/bin/env bash

export PROFILE_NAME="Solarized Dark Patched"

export COLOR_01="#002831"           # Black (Host)
export COLOR_02="#D11C24"           # Red (Syntax string)
export COLOR_03="#738A05"           # Green (Command)
export COLOR_04="#A57706"           # Yellow (Command second)
export COLOR_05="#2176C7"           # Blue (Path)
export COLOR_06="#C61C6F"           # Magenta (Syntax var)
export COLOR_07="#259286"           # Cyan (Prompt)
export COLOR_08="#EAE3CB"           # White

export COLOR_09="#475B62"           # Bright Black
export COLOR_10="#BD3613"           # Bright Red (Command error)
export COLOR_11="#475B62"           # Bright Green (Exec)
export COLOR_12="#536870"           # Bright Yellow
export COLOR_13="#708284"           # Bright Blue (Folder)
export COLOR_14="#5956BA"           # Bright Magenta
export COLOR_15="#819090"           # Bright Cyan
export COLOR_16="#FCF4DC"           # Bright White

export BACKGROUND_COLOR="#001E27"   # Background
export FOREGROUND_COLOR="#708284"   # Foreground (Text)

export CURSOR_COLOR="#708284" # Cursor

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
