#!/usr/bin/env bash

export PROFILE_NAME="Tempus Summer"

export COLOR_01="#202c3d"           # Black (Host)
export COLOR_02="#fe6f70"           # Red (Syntax string)
export COLOR_03="#4eb075"           # Green (Command)
export COLOR_04="#ba9a0a"           # Yellow (Command second)
export COLOR_05="#60a1e6"           # Blue (Path)
export COLOR_06="#d285ad"           # Magenta (Syntax var)
export COLOR_07="#3dae9f"           # Cyan (Prompt)
export COLOR_08="#949cbf"           # White

export COLOR_09="#39304f"           # Bright Black
export COLOR_10="#ec7f4f"           # Bright Red (Command error)
export COLOR_11="#5baf4f"           # Bright Green (Exec)
export COLOR_12="#be981f"           # Bright Yellow
export COLOR_13="#8599ef"           # Bright Blue (Folder)
export COLOR_14="#cc82d7"           # Bright Magenta
export COLOR_15="#2aacbf"           # Bright Cyan
export COLOR_16="#a0abae"           # Bright White

export BACKGROUND_COLOR="#202c3d"   # Background
export FOREGROUND_COLOR="#a0abae"   # Foreground (Text)

export CURSOR_COLOR="#a0abae" # Cursor

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
