#!/usr/bin/env bash 

#==================== CONFIG THIS ======================#
export COLOR_01='#F9F5F5'   # HOST          :: WHITE
export COLOR_02='#CC0000'   # SYNTAX_STRING :: RED
export COLOR_03='#1F1E1F'		# COMMAND				:: BLACK
export COLOR_04='#ADA110'		# COMMAND_COLOR2:: YELLOW
export COLOR_05='#FF004E'		# PATH					:: PINK
export COLOR_06='#75507B'		# SYNTAX_VAR		:: PURPLE
export COLOR_07='#06919A'		# PROMP					:: BLUE
export COLOR_08='#FFFFFF'		#								:: CREAM WHITE

export COLOR_09='#555753'		#								:: DARK GREY
export COLOR_10='#EF2929'		# COMMAND_ERROR :: RED
export COLOR_11='#FF0000'		# EXEC					:: RED
export COLOR_12='#ADA110'   #								:: YELLOW
export COLOR_13='#5F4AA6'		# FOLDER				:: PURPLE
export COLOR_14='#B74438'		#								:: DARK RED
export COLOR_15='#408F0C'		#								:: GREEN
export COLOR_16='#FFFFFF'		#								:: WHITE

export BACKGROUND_COLOR='#1F1E1F'   #BACKGROUND COLOR :: GREYGEO
export FOREGROUND_COLOR='#FFFFFF'   #FOREGROUND COLOR (TEXT) :: WHITE
export CURSOR_COLOR="$FOREGROUND_COLOR" #CURSORT COLOR
export PROFILE_NAME="GeoHot"
#==================== CONFIG THIS ======================#

#=======================================================#
#             		 | APPLY COLOR |
#=======================================================#
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

# Allow developer to change url to forked url for easier testing
# IMPORTANT: Make sure you export this variable if your main shell is not bash
BASE_URL=${BASE_URL:-"https://raw.githubusercontent.com/Mayccoll/Gogh/master"}

if [[ -e "${PARENT_PATH}/apply-colors.sh" ]]; then
  bash "${PARENT_PATH}/apply-colors.sh"
else
  if [[ "$(uname)" = "Darwin" ]]; then
    # OSX ships with curl and ancient bash
    bash -c "$(curl -so- "${BASE_URL}/apply-colors.sh")"
  else
    # Linux ships with wget
    bash -c "$(wget -qO- "${BASE_URL}/apply-colors.sh")"
  fi
fi
