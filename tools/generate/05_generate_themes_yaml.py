# Step 5 of the generate/ pipeline.
# Export theme data from data/themes.json to data/themes.yaml.
# Preserves the key order used in the JSON source for each theme entry.

import json
import yaml

with open('data/themes.json', 'r') as json_file:
    data = json.load(json_file)

with open('data/themes.yaml', 'w') as yaml_file:
    yaml.safe_dump(data, yaml_file, sort_keys=False, allow_unicode=True)
