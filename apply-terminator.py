import json
import os
import sys

from configobj import ConfigObj

def get_conf_path():
    try:
        configdir = os.environ['XDG_CONFIG_HOME']
    except KeyError:
        configdir = os.path.join(os.path.expanduser('~'), '.config')
    return(os.path.join(configdir, 'terminator/config'))
# end


conf_path = get_conf_path()

js = json.loads(sys.argv[1])

config = ConfigObj(conf_path)
config['profiles']['default']['foreground_color'] = js['colors']['primary']['foreground']
config['profiles']['default']['background_color'] = js['colors']['primary']['background']
config['profiles']['default']['palette'] = js['colors']['pallete']
config.write()
