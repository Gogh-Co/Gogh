
![Gogh](https://raw.githubusercontent.com/Gogh-Co/Gogh/master/images/gogh/Gogh-logo.png)

-----

## How to ceate your own theme

Good news! Contributing with new themes is now easier and less intimidating.

You just need to create a YAML format file, following the example of the other files in the `themes` folder.

Please keep in mind a few simple rules.

- The file name should match the name of the theme. For example:
    - **Filename**: `Adventure Time.yml`
    - **Inside the .yml file**: `name: 'Adventure Time'`
- Use title case for all words by capitalizing their first letter.
- Ensure that the contrast is sufficient for good legibility.

**Now you can send Pull Request.**

**Thank you!**

---

## Theme .yml example

```yml
---
name: 'Adventure Time'

color_01: '#050404'    # Black (Host)
color_02: '#BD0013'    # Red (Syntax string)
color_03: '#4AB118'    # Green (Command)
color_04: '#E7741E'    # Yellow (Command second)
color_05: '#0F4AC6'    # Blue (Path)
color_06: '#665993'    # Magenta (Syntax var)
color_07: '#70A598'    # Cyan (Prompt)
color_08: '#F8DCC0'    # White

color_09: '#4E7CBF'    # Bright Black
color_10: '#FC5F5A'    # Bright Red (Command error)
color_11: '#9EFF6E'    # Bright Green (Exec)
color_12: '#EFC11A'    # Bright Yellow
color_13: '#1997C6'    # Bright Blue (Folder)
color_14: '#9B5953'    # Bright Magenta
color_15: '#C8FAF4'    # Bright Cyan
color_16: '#F6F5FB'    # Bright White

background: '#1F1D45'  # Background
foreground: '#F8DCC0'  # Foreground (Text)

cursor: '#F8DCC0'      # Cursor
```
---
## Explanation of colors and variables

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

![Colors](https://raw.githubusercontent.com/Gogh-Co/Gogh/master/images/gogh/colors.png)

