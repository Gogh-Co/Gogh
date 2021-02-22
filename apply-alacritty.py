import io
import json
import sys
from appdirs import user_config_dir
from ruamel.yaml import YAML # use ruamel.yaml to preserve comments in config


yaml = YAML()
conf = user_config_dir('alacritty') + "/alacritty.yml"
# Read alacritty config
with open(conf, 'r') as stream:
    data_loaded = yaml.load(stream)

js = json.loads(sys.argv[1])

# Use update to not remove existing comments
data_loaded['colors']['primary'].update(js['colors']['primary'])
data_loaded['colors']['normal'].update(js['colors']['normal'])
data_loaded['colors']['bright'].update(js['colors']['bright'])

# Write alacritty config
with io.open(conf, 'w', encoding='utf8') as outfile:
    yaml.dump(data_loaded, outfile)
