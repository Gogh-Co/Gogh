import os
import json
import yaml
import hashlib

source_path = "../themes-yml"
dest_path = "../data/themes.json"
themes = []

os.remove(dest_path)

for filename in os.listdir(source_path):
    if filename.endswith(".yml"):
        with open(os.path.join(source_path, filename), "r") as f:
            data = yaml.safe_load(f)
                    # Concatenate values of each key
            values = ''
            for key in data:
                values += str(data[key])

            # Generate SHA-256 hash
            hash_object = hashlib.sha256(values.encode())
            hash_hex = hash_object.hexdigest()

            theme = {f"{key}": data[key] for key in data if key.startswith("color")}
            theme.update({
                "name": data["name"],
                "foreground": data["foreground"],
                "background": data["background"],
                "cursorColor": data["cursor"],
                "hash": hash_hex
            })
            themes.append(theme)

themes = sorted(themes, key=lambda x: x["name"])

json_data = {"themes": themes}

with open(dest_path, "w") as f:
    json.dump(json_data, f)