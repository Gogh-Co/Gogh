import json
import csv

with open('data/themes.json', 'r') as json_file:
    data = json.load(json_file)

with open('data/themes.csv', mode='w', newline='') as file:
    writer = csv.DictWriter(file, fieldnames=data[0].keys())
    writer.writeheader()
    writer.writerows(data)
