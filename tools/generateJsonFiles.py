import json
import os
import re
from unidecode import unidecode

# Load the JSON object from a file or a string
with open('./data/themes.json', 'r') as f:
    json_obj = json.load(f)

# Get the list of themes
themes = json_obj

# Create or empty the directory to store the output files
output_dir = './json'
if not os.path.exists(output_dir):
    os.makedirs(output_dir)
else:
    for filename in os.listdir(output_dir):
        os.remove(os.path.join(output_dir, filename))

# Iterate over each theme and write it to a new file
for theme in themes:
    # Get the name of the theme and remove accents
    name = theme['name'].lower()
    name = unidecode(name)
    name = re.sub(r'[^\w-]+', '-', name) # Replace non-alphanumeric characters with a dash
    # Convert the theme dictionary to JSON
    json_str = json.dumps(theme)
    # Write the JSON string to a new file with the theme name as the filename
    with open(f'{output_dir}/{name}.json', 'w') as f:
        f.write(json_str)