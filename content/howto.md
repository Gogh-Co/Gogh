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
    BACKGROUND_COLOR="#2F373B"    # Background Color
    FOREGROUND_COLOR="#d9e6f2"   # Text

    COLOR_01="#383838"           # HOST
    COLOR_02="#9f9393"           # SYNTAX_STRING
    COLOR_03="#939f93"           # COMMAND
    COLOR_04="#9f9f93"           # COMMAND_COLOR2
    COLOR_05="#7cafc2"           # PATH
    COLOR_06="#9f939f"           # SYNTAX_VAR
    COLOR_07="#ab4642"           # PROMP
    COLOR_08="#F2F2F2"           #

    COLOR_09="#5D5D5D"           #
    COLOR_10="#ab4642"           # COMMAND_ERROR
    COLOR_11="#a1b56c"           # EXEC
    COLOR_12="#FFD00A"           #
    COLOR_13="#7cafc2"           # FOLDER
    COLOR_14="#FF1D62"           #
    COLOR_15="#4BB8FD"           #
    COLOR_16="#A020F0"           #
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
colors () {
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