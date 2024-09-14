import os
import yaml

# Directory containing the old files
old_files_dir = 'themes_old/'
new_files_dir = 'themes/'

# Create new_files directory if it doesn't exist
if not os.path.exists(new_files_dir):
    os.makedirs(new_files_dir)

# Fields to ensure in the new format
new_format_fields = [
    'name', 'author', 'variant', 'color_01', 'color_02', 'color_03', 'color_04',
    'color_05', 'color_06', 'color_07', 'color_08', 'color_09', 'color_10',
    'color_11', 'color_12', 'color_13', 'color_14', 'color_15', 'color_16',
    'background', 'foreground', 'cursor'
]

# Default values for new fields
default_values = {
    'author': '',
    'variant': ''
}

# Comments for each color field
color_comments = {
    'color_01': '# Black (Host)',
    'color_02': '# Red (Syntax string)',
    'color_03': '# Green (Command)',
    'color_04': '# Yellow (Command second)',
    'color_05': '# Blue (Path)',
    'color_06': '# Magenta (Syntax var)',
    'color_07': '# Cyan (Prompt)',
    'color_08': '# White',
    'color_09': '# Bright Black',
    'color_10': '# Bright Red (Command error)',
    'color_11': '# Bright Green (Exec)',
    'color_12': '# Bright Yellow',
    'color_13': '# Bright Blue (Folder)',
    'color_14': '# Bright Magenta',
    'color_15': '# Bright Cyan',
    'color_16': '# Bright White'
}

# Function to convert files with proper formatting
def convert_file(old_file_path, new_file_path):
    with open(old_file_path, 'r') as file:
        data = yaml.safe_load(file)

    # Ensure all new format fields are present
    for field in new_format_fields:
        if field not in data:
            data[field] = default_values.get(field, '')

    # Write the data to the new file with proper formatting
    with open(new_file_path, 'w') as file:
        file.write("---\n")
        file.write(f"name: '{data['name']}'\n")
        file.write(f"author: '{data['author']}'             # 'AUTHOR NAME (http://WEBSITE.com)'\n")
        file.write(f"variant: '{data['variant']}'            # dark or light\n\n")

        # Write color fields with appropriate comments
        for i in range(1, 9):
            color_key = f"color_{i:02d}"
            file.write(f"{color_key}: '{data[color_key]}'    {color_comments[color_key]}\n")

        file.write("\n")

        for i in range(9, 17):
            color_key = f"color_{i:02d}"
            file.write(f"{color_key}: '{data[color_key]}'    {color_comments[color_key]}\n")

        file.write(f"\nbackground: '{data['background']}'  # Background\n")
        file.write(f"foreground: '{data['foreground']}'  # Foreground (Text)\n\n")
        file.write(f"cursor: '{data['cursor']}'      # Cursor\n")

# Convert all YAML files in the directory
def convert_all_files():
    for old_file in os.listdir(old_files_dir):
        old_file_path = os.path.join(old_files_dir, old_file)
        new_file_path = os.path.join(new_files_dir, old_file)

        if os.path.isfile(old_file_path):
            convert_file(old_file_path, new_file_path)

# Run the conversion
convert_all_files()
