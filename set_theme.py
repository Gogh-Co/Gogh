import sys
import json
import getpass

filename = "/home/{user_name}/.config/terminator/config".format(user_name=getpass.getuser())

# returns bash friendly str - no spaces
def get_bash_name(theme_name):
    return str(theme_name).strip()

# retrieves info from json & creates new profile in .config/terminator/config
def set_new_theme(theme_id):
    theme = None
    theme_name = ""
    if theme_id.isdigit():
        theme = load_theme_by_nb(int(theme_id))
        theme_name = theme["name"]
    else:
        theme_name = theme_id
        theme = load_theme(theme_name)
        
    inline_colors = get_inline_colors(theme)
    foreground = theme["foreground"]
    background = theme["background"]
    cursor = theme["cursor"]
    add_theme(theme_name, foreground, background, inline_colors, cursor)

# write theme in config file
def add_theme(theme_name, foreground, background, inline_colors, cursor):
    global filename

    # find default theme placement in data
    with open(filename) as f:
        data=f.read()
        def_string="[[default]]"
        def_idx = data.find(def_string)
        def_beg = def_idx+len(def_string)
        def_end = data[def_beg:].find('[')+def_beg
        subdata = data[def_beg:def_end]
    
    # replace defining values in data
    params = [
        ["background_color = \"", background],
        ["foreground_color = \"", foreground],
        ["palette = \"", inline_colors],
        ["cursor_color = \"", cursor]
    ]
    subdata =data[def_beg:def_end]
    for param in params:
        index = subdata.find(param[0])
        if(index >= 0):
            param0len = len(param[0])
            subdata = subdata.replace(subdata[index+param0len: index+param0len+len(param[1])], param[1], 1)
    data = data[:def_beg]+subdata+data[def_end:]

    # save new profile
    if data.find(theme_name) < 0:
        data = add_new_theme(theme_name, data, subdata)

    # writes new data to config file
    with open(filename,'w') as o:
        o.write(data)

def add_new_theme(theme_name, data, subdata):
    subdata = "  [[{theme_name}]]".format(theme_name=theme_name)+subdata
    return data.replace("[profiles]\n", "[profiles]\n"+subdata)

# returns the theme dictionnary associated with theme_name - None if theme_name doesn't exist
def load_theme(theme_name):
    with open('data/themes.json') as user_file:
        parsed_json = json.load(user_file)
    themes = parsed_json["themes"]
    for t in range(len(themes)):
        if themes[t]["name"] == theme_name:
            return themes[t]
    return None

def load_theme_by_nb(theme_nb):
    with open('data/themes.json') as user_file:
        parsed_json = json.load(user_file)
    themes = parsed_json["themes"]
    if theme_nb > len(themes):
        return None
    
    return themes[theme_nb-1]

# concatenate all the hexa codes of a theme in one string, seperated with ':'
def get_inline_colors(theme):
    inline =""
    colors = []
    for i in range (1, 17):
        colors.append("color_" + (str(i) if i > 9 else '0'+str(i)) )
    for color in colors:
        inline += theme[color]+':'
    return inline[:-1]


if __name__ == "__main__":
    if len(sys.argv)  <= 1:
        print("You must enter you theme name")
    else:
        theme_name = str(sys.argv[1])
        set_new_theme(theme_name)