import io
import json
import os
import sys

import tomli
import tomli_w
from ruamel.yaml import YAML  # use ruamel.yaml to preserve comments in config


def printerr(*args, **kwargs):
    print(*args, file=sys.stderr, **kwargs)


def get_conf_path():
    # Determine system
    # When we are in some Java world do extra checks
    if sys.platform.startswith('java'):
        import platform
        os_name = platform.java_ver()[3][0]
        if os_name.startswith('Windows'):  # "Windows XP", "Windows 7", etc.
            system = 'win32'
        else:  # anything that isn't windows ("darwin", "Linux", "SunOS", "FreeBSD", "Arch", etc.)
            system = 'linux2'
    else:
        system = sys.platform

    if system == 'win32':
        # In windows alacritty config can only exist in one place
        alacritty_path = os.path.expandvars(r'%APPDATA%\alacritty\alacritty.yml')
        if os.path.exists(alacritty_path):
            return alacritty_path
        # Check for TOML config for newer version of Alacritty
        alacritty_path = os.path.expandvars(r'%APPDATA%\alacritty\alacritty.toml')
        if os.path.exists(alacritty_path):
            return alacritty_path
    else:
        # If it is not win32 it can exists in only a few other places
        xdg_config_home = os.getenv('XDG_CONFIG_HOME')
        if xdg_config_home is not None and os.path.exists(xdg_config_home + '/alacritty/alacritty.yml'):
            return xdg_config_home + "/alacritty/alacritty.yml"
        if xdg_config_home is not None and os.path.exists(xdg_config_home + "/alacritty.yml"):
            return xdg_config_home + "/alacritty.yml"

        if xdg_config_home is not None and os.path.exists(xdg_config_home + '/alacritty/alacritty.toml'):
            return xdg_config_home + "/alacritty/alacritty.toml"
        if xdg_config_home is not None and os.path.exists(xdg_config_home + "/alacritty.toml"):
            return xdg_config_home + "/alacritty.toml"

        home = os.getenv('HOME')
        if home is not None and os.path.exists(home + '/.config/alacritty/alacritty.yml'):
            return home + "/.config/alacritty/alacritty.yml"
        if home is not None and os.path.exists(home + '/.config/alacritty/alacritty.yml'):
            return home + "/.config/alacritty/alacritty.yml"
        if home is not None and os.path.exists(home + '/.alacritty.yml'):
            return home + "/.alacritty.yml"

        if home is not None and os.path.exists(home + '/.config/alacritty/alacritty.toml'):
            return home + "/.config/alacritty/alacritty.toml"
        if home is not None and os.path.exists(home + '/.config/alacritty/alacritty.toml'):
            return home + "/.config/alacritty/alacritty.toml"
        if home is not None and os.path.exists(home + '/.alacritty.toml'):
            return home + "/.alacritty.toml"

    printerr("Could not find alacritty config file\nPlease make sure you have a file in one of the paths specified on\nhttps://github.com/alacritty/alacritty#configuration")
    sys.exit(1)
# end


conf_path = get_conf_path()
yaml = YAML()

# Read & parse alacritty config
if conf_path.endswith('yml'):
    with open(conf_path, 'r') as stream:
        data_loaded = yaml.load(stream)
elif conf_path.endswith('toml'):
    with open(conf_path, 'rb') as stream:
        data_loaded = tomli.load(stream)
else:
    printerr(f'Config parsing no available for config file {conf_path}')
    raise NotImplementedError(f'Config parsing not available for config file {conf_path}')

# parse new colors
js = json.loads(sys.argv[1])

# Update yaml file
try:
    # Use update to not remove existing comments
    data_loaded['colors']['primary'].update(js['colors']['primary'])
    data_loaded['colors']['normal'].update(js['colors']['normal'])
    data_loaded['colors']['bright'].update(js['colors']['bright'])
except KeyError:
    printerr("Could not find existing 'colors' settings in your alacritty.yml file\nplease make sure to uncomment\n'colors', as well as 'primary', 'normal' and 'bright'")
    printerr("Check the example config at\nhttps://github.com/alacritty/alacritty/releases/download/v0.12.2/alacritty.yml for more information")
    printerr("Note that alacritty following release 0.13.0 uses toml configuration.")
    sys.exit(1)

# make sure the user is okay with having their config changed
if not "GOGH_NONINTERACTIVE" in os.environ:
    answer = input("This script will update your alacritty config at: \n" +
                   conf_path + "\nIt is recommended to make a copy of this file before proceeding.\nAre you sure you want to continue? (Y/N)\n")
    if answer.lower() not in ['y', 'yes']:
        print("Aborted")
        sys.exit(1)

# Write alacritty config
if conf_path.endswith('yml'):
    with io.open(conf_path, 'w', encoding='UTF8') as outfile:
        yaml.dump(data_loaded, outfile)
elif conf_path.endswith('toml'):
    with open(conf_path, 'wb') as outfile:
        tomli_w.dump(data_loaded, outfile)
else:
    pass
