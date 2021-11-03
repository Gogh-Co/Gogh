#!/bin/bash

# |░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░|
# | ·······  Colors
# |░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░|

RS="\e[0m"
# Basic Colors
BLACK="\e[0;30m"
RED="\e[0;31m"
GREEN="\e[0;32m"
YELLOW="\e[0;33m"
BLUE="\e[0;34m"
PURPLE="\e[0;35m"
CYAN="\e[0;36m"
WHITE="\e[0;37m"

# |
# | ::::::: Script Path
# |
SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

createColors() {
  source $1

  # Get the index of the theme from the second argument
  local index="$(printf %02i $2)"
  echo '    {'
  echo '      "name": "'"$PROFILE_NAME (theme $index)"'",'
  echo '      "black": "'"$COLOR_01"'",'
  echo '      "red": "'"$COLOR_02"'",'
  echo '      "green": "'"$COLOR_03"'",'
  echo '      "yellow": "'"$COLOR_04"'",'
  echo '      "blue": "'"$COLOR_05"'",'
  echo '      "purple": "'"$COLOR_06"'",'
  echo '      "cyan": "'"$COLOR_07"'",'
  echo '      "white": "'"$COLOR_08"'",'
  echo '      "brightBlack": "'"$COLOR_09"'",'
  echo '      "brightRed": "'"$COLOR_10"'",'
  echo '      "brightGreen": "'"$COLOR_11"'",'
  echo '      "brightYellow": "'"$COLOR_12"'",'
  echo '      "brightBlue": "'"$COLOR_13"'",'
  echo '      "brightPurple": "'"$COLOR_14"'",'
  echo '      "brightCyan": "'"$COLOR_15"'",'
  echo '      "brightWhite": "'"$COLOR_16"'",'
  echo '      "foreground": "'"$FOREGROUND_COLOR"'",'
  echo '      "background": "'"$BACKGROUND_COLOR"'",'
  echo '      "cursorColor": "'"$CURSOR_COLOR"'"'
  echo '    },'
}

mkdir -p $SCRIPT_PATH/../.tmp

echo '{' > $SCRIPT_PATH/../data/themes.json
echo '  "themes": [' >> $SCRIPT_PATH/../data/themes.json

ls -1 $SCRIPT_PATH/../themes/*.sh | while read a; do grep "export" $a > "${a/themes/.tmp}"; done

ls -1 $SCRIPT_PATH/../.tmp/*.sh | while read a; do sed -i /IMPORTANT/d  "${a}"; done

# Keep track of the theme id to include it as a detail in the theme name
theme_id=1
ls -1 $SCRIPT_PATH/../.tmp/*.sh | while read a; do 
  createColors "$a" "$theme_id" >> $SCRIPT_PATH/../data/themes.json;
  let theme_id++
done

echo '  ]' >> $SCRIPT_PATH/../data/themes.json
echo '}' >> $SCRIPT_PATH/../data/themes.json

# Use sed to remove the final trailing comma in the json file
cp $SCRIPT_PATH/../data/themes.json $SCRIPT_PATH/../data/themes.json.tmp
sed -e ':a' -e 'N' -e '$!ba' -e 's/},\n  ]/}\n  ]/g' \
  $SCRIPT_PATH/../data/themes.json.tmp > $SCRIPT_PATH/../data/themes.json
rm $SCRIPT_PATH/../data/themes.json.tmp

echo ""
echo "File location:"
echo -e "${GREEN} data/themes.json"
