Gogh
====

![elementary](https://raw.githubusercontent.com/Mayccoll/Elementary-OS-Terminal-Colors/master/images/Gogh-icons.png)

## How To

#### New Script

To have more control over colors, I made a new simple script to change those made with 4 bits.
This new script has variables which can be set according to preferences.
Please feel free to use and create your own color schemes.

**You can send Pull Request.**

- **The Script**

https://github.com/Mayccoll/Elementary-OS-Terminal-Colors/blob/master/base.sh

- **Variables**

```bash
    # Section 1
    COLOR_01="#363636"          # HOST
    COLOR_02="#ff0883"          # SYNTAX_STRING
    COLOR_03="#83ff08"          # COMMAND
    COLOR_04="#ff8308"          # COMMAND_COLOR2
    COLOR_05="#0883ff"          # PATH
    COLOR_06="#8308ff"          # SYNTAX_VAR
    COLOR_07="#08ff83"          # PROMP
    COLOR_08="#b6b6b6"          #

    # Section 2
    COLOR_09="#424242"          #
    COLOR_10="#ff1e8e"          # COMMAND_ERROR
    COLOR_11="#8eff1e"          # EXEC
    COLOR_12="#ff8e1e"          #
    COLOR_13="#1e8eff"          # FOLDER
    COLOR_14="#8e1eff"          #
    COLOR_15="#1eff8e"          #
    COLOR_16="#c2c2c2"          #

    # Section 3
    BACKGROUND_COLOR="#0d1926"  # Background Color
    FOREGROUND_COLOR="#b4e1fd"  # Text
    CURSOR_COLOR="$FOREGROUND_COLOR" # Cursors
```
- **Explanation of colors and variables**

The colors of the terminal are composed of 18 colors in 3 sections.

Section 1: Regular text.

Section 2: Bold text.

Section 3: text and background.

The basic colors are 8:

- Black
- Red
- Green
- Yellow
- Blue
- Purple
- Cyan
- White

In comments variables is that of the console belongs each color.

Here is a picture that explains a little better as colors are distributed.

![Colors](https://raw.githubusercontent.com/Mayccoll/Elementary-OS-Terminal-Colors/master/images/colors.png)

- **View Colors**

You can use this alias to view your color scheme in termial

```bash
color () {
    # echo ""
    #black
    echo -e "\e[0;30m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 01 0;30m"
    #red
    echo -e "\e[0;31m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 02 0;31m"
    #green
    echo -e "\e[0;32m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 03 0;32m"
    #yellow
    echo -e "\e[0;33m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 04 0;33m"
    #blue
    echo -e "\e[0;34m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 05 0;34m"
    #purple
    echo -e "\e[0;35m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 06 0;35m"
    #cyan
    echo -e "\e[0;36m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 07 0;36m"
    #white
    echo -e "\e[0;37m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 08 0;37m"
    echo ""
    #black
    echo -e "\e[1;30m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 09 1;30m"
    #red
    echo -e "\e[1;31m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 10 1;31m"
    #green
    echo -e "\e[1;32m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 11 1;32m"
    #yellow
    echo -e "\e[1;33m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 12 1;33m"
    #blue
    echo -e "\e[1;34m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 13 1;34m"
    #purple
    echo -e "\e[1;35m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 14 1;35m"
    #cyan
    echo -e "\e[1;36m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 15 1;36m"
    #white
    echo -e "\e[1;37m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 16 1;37m"
    echo ""
    echo -e "\e[0;30m█████\\e[0m\e[0;31m█████\\e[0m\e[0;32m█████\\e[0m\e[0;33m█████\\e[0m\e[0;34m█████\\e[0m\e[0;35m█████\\e[0m\e[0;36m█████\\e[0m\e[0;37m█████\\e[0m"
    echo -e "\e[0m\e[1;30m█████\\e[0m\e[1;31m█████\\e[0m\e[1;32m█████\\e[0m\e[1;33m█████\\e[0m\e[1;34m█████\\e[0m\e[1;35m█████\\e[0m\e[1;36m█████\\e[0m\e[1;37m█████\\e[0m"
}
```
