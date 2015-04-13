Elementary-OS-Terminal-Colors
=============================

#### Color Schemes For Elementary OS - Linux Mint - Ubuntu

![elementary](https://raw.githubusercontent.com/Mayccoll/Elementary-OS-Terminal-Colors/master/images/themes.gif)
----

### What's  New

Elementary os Freya 0.3 color scheme.

```bash
  wget -O xt  http://git.io/vvmPj && chmod +x xt && ./xt && rm xt
```

![new](https://raw.githubusercontent.com/Mayccoll/Elementary-OS-Terminal-Colors/master/images/new.png)

### How to install:

- Just copy and paste One line command

```bash
    $ wget -O xt  http://git.io/fXU8Jg && chmod +x xt && ./xt && rm xt
```
This way of installing is equals the below, the only thing is that a shortening of urls (git.io) was used and fits all commands on a single line.

- **or** Download and save the script file, make this file executable and run it:

```bash
    $ wget https://raw.githubusercontent.com/Mayccoll/Elementary-OS-Terminal-Colors/master/elementary.sh
    $ chmod +x elementary.sh
    $ ./elementary.sh
```



#### Elementary OS

 - Uncomment the following line in ```.bashrc```

```bash
    #force_color_prompt=yes
```

 - execute in terminal

```bash
    $ source .bashrc
```

### New Script

To have more control over colors, I made a new simple script to change those made with 4 bits.
This new script has variables which can be set according to preferences.
Please feel free to use and create your own color schemes.

**You can send Pull Request.**

- **The Script**

https://github.com/Mayccoll/Elementary-OS-Terminal-Colors/blob/master/base.sh

- **Variables**

```bash
    BACKGROUD_COLOR="#2F373B"    # Background Color
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
Black
White
network
green
Yellow
Blue
Purple
Cyan

In comments variables is that of the console belongs each color.

Here is a picture that explains a little better as colors are distributed.

![Colors](https://raw.githubusercontent.com/Mayccoll/Elementary-OS-Terminal-Colors/master/images/colors.png)

- **View Colors**

You can use this alias to view your color scheme in termial

```bash
colors () {
    echo ""
    echo "# Regular"

    #black
    echo -e "\e[0;30m *** AaBbCs ---  ███ \\e[0m ---> COLOR_01"
    #red
    echo -e "\e[0;31m *** AaBbCs ---  ███ \\e[0m ---> COLOR_02"
    #green
    echo -e "\e[0;32m *** AaBbCs ---  ███ \\e[0m ---> COLOR_03"
    #yellow
    echo -e "\e[0;33m *** AaBbCs ---  ███ \\e[0m ---> COLOR_04"
    #blue
    echo -e "\e[0;34m *** AaBbCs ---  ███ \\e[0m ---> COLOR_05"
    #purple
    echo -e "\e[0;35m *** AaBbCs ---  ███ \\e[0m ---> COLOR_06"
    #cyan
    echo -e "\e[0;36m *** AaBbCs ---  ███ \\e[0m ---> COLOR_07"
    #white
    echo -e "\e[0;37m *** AaBbCs ---  ███ \\e[0m ---> COLOR_08"

    echo ""
    echo "# Bold"

    #black
    echo -e "\e[1;30m *** AaBbCs ---  ███ \\e[0m ---> COLOR_09"
    #red
    echo -e "\e[1;31m *** AaBbCs ---  ███ \\e[0m ---> COLOR_10"
    #green
    echo -e "\e[1;32m *** AaBbCs ---  ███ \\e[0m ---> COLOR_11"
    #yellow
    echo -e "\e[1;33m *** AaBbCs ---  ███ \\e[0m ---> COLOR_12"
    #blue
    echo -e "\e[1;34m *** AaBbCs ---  ███ \\e[0m ---> COLOR_13"
    #purple
    echo -e "\e[1;35m *** AaBbCs ---  ███ \\e[0m ---> COLOR_14"
    #cyan
    echo -e "\e[1;36m *** AaBbCs ---  ███ \\e[0m ---> COLOR_15"
    #white
    echo -e "\e[1;37m *** AaBbCs ---  ███ \\e[0m ---> COLOR_16"

}
```
#### Credits:

- http://ciembor.github.io/4bit/

#### contributors:

- https://github.com/javaguirre

-------

### More themes:

- **Freya.sh**

![freya](https://raw.githubusercontent.com/Mayccoll/Elementary-OS-Terminal-Colors/master/images/freya.png)


```bash
# One line install:
$ wget -O xt  http://git.io/vvmPj && chmod +x xt && ./xt && rm xt
```

- **aci.sh**

![aci](https://raw.githubusercontent.com/Mayccoll/Elementary-OS-Terminal-Colors/master/images/aci.png)


```bash
# One line install:
$ wget -O xt  http://git.io/mGzs5Q && chmod +x xt && ./xt && rm xt
```

- **aco.sh**

![aco](https://raw.githubusercontent.com/Mayccoll/Elementary-OS-Terminal-Colors/master/images/aco.png)

```bash
# One line install:
$ wget -O xt  http://git.io/0l4A5w && chmod +x xt && ./xt && rm xt
```

- **azu.sh**

![azu](https://raw.githubusercontent.com/Mayccoll/Elementary-OS-Terminal-Colors/master/images/azu.png)

```bash
# One line install:
$ wget -O xt  http://git.io/pDU8aQ && chmod +x xt && ./xt && rm xt
```

- **cai.sh**

![cai](https://raw.githubusercontent.com/Mayccoll/Elementary-OS-Terminal-Colors/master/images/cai.png)

```bash
# One line install:
$ wget -O xt  http://git.io/ECkzjg && chmod +x xt && ./xt && rm xt
```

- **elic.sh**

![elic](https://raw.githubusercontent.com/Mayccoll/Elementary-OS-Terminal-Colors/master/images/elic.png)

```bash
# One line install:
$ wget -O xt  http://git.io/sSSshQ && chmod +x xt && ./xt && rm xt
```

- **elio.sh**

![elio](https://raw.githubusercontent.com/Mayccoll/Elementary-OS-Terminal-Colors/master/images/elio.png)

```bash
# One line install:
$ wget -O xt  http://git.io/bCVhIA && chmod +x xt && ./xt && rm xt
```

- **miu.sh**

![miu](https://raw.githubusercontent.com/Mayccoll/Elementary-OS-Terminal-Colors/master/images/miu.png)

```bash
# One line install:
$ wget -O xt  http://git.io/b-eZVQ && chmod +x xt && ./xt && rm xt
```

- **tin.sh**

![tin](https://raw.githubusercontent.com/Mayccoll/Elementary-OS-Terminal-Colors/master/images/tin.png)

```bash
# One line install:
$ wget -O xt  http://git.io/W5dkrA && chmod +x xt && ./xt && rm xt
```


- **elementary.sh**

![elementary](https://raw.githubusercontent.com/Mayccoll/Elementary-OS-Terminal-Colors/master/images/elementary.png)

```bash
# One line install:
$ wget -O xt  http://git.io/fXU8Jg && chmod +x xt && ./xt && rm xt
```


- **vag.sh**

![vag](https://raw.githubusercontent.com/Mayccoll/Elementary-OS-Terminal-Colors/master/images/vag.png)

```bash
# One line install:
$ wget -O xt  http://git.io/xwkzlg && chmod +x xt && ./xt && rm xt
```


- **bim.sh**

![bim](https://raw.githubusercontent.com/Mayccoll/Elementary-OS-Terminal-Colors/master/images/bim.png)

```bash
# One line install:
$ wget -O xt  http://git.io/-t0lXg && chmod +x xt && ./xt && rm xt
```


- **jup.sh**

![jup](https://raw.githubusercontent.com/Mayccoll/Elementary-OS-Terminal-Colors/master/images/jup.png)

```bash
# One line install:
$ wget -O xt  http://git.io/PE0xXw && chmod +x xt && ./xt && rm xt
```


- **mar.sh**

![mar](https://raw.githubusercontent.com/Mayccoll/Elementary-OS-Terminal-Colors/master/images/mar.png)

```bash
# One line install:
$ wget -O xt  http://git.io/g749-Q && chmod +x xt && ./xt && rm xt
```


- **nep.sh**

![nep](https://raw.githubusercontent.com/Mayccoll/Elementary-OS-Terminal-Colors/master/images/nep.png)

```bash
# One line install:
$ wget -O xt  http://git.io/6hJsiw && chmod +x xt && ./xt && rm xt
```


- **sat.sh**

![sat](https://raw.githubusercontent.com/Mayccoll/Elementary-OS-Terminal-Colors/master/images/vag.png)

```bash
# One line install:
$ wget -O xt  http://git.io/luv_2A && chmod +x xt && ./xt && rm xt
```


- **shel.sh**

![shel](https://raw.githubusercontent.com/Mayccoll/Elementary-OS-Terminal-Colors/master/images/shel.png)

```bash
# One line install:
$ wget -O xt  http://git.io/TF6KDA && chmod +x xt && ./xt && rm xt
```


- **ura.sh**

![ura](https://raw.githubusercontent.com/Mayccoll/Elementary-OS-Terminal-Colors/master/images/ura.png)

```bash
# One line install:
$ wget -O xt  http://git.io/GUFFsQ && chmod +x xt && ./xt && rm xt
```


- **pali.sh**

![pali](https://raw.githubusercontent.com/Mayccoll/Elementary-OS-Terminal-Colors/master/images/pali.png)

```bash
# One line install:
$ wget -O xt  http://git.io/xh3YKA && chmod +x xt && ./xt && rm xt
```


- **hydrid.sh**

![hydrid](https://raw.githubusercontent.com/Mayccoll/Elementary-OS-Terminal-Colors/master/images/Hybrid.png)

```bash
# One line install:
$ wget -O xt  http://git.io/PWgNtA && chmod +x xt && ./xt && rm xt
```
