from datetime import datetime
from pathlib import Path

# Create or set the output directory
output_dir = Path('./tools')
output_dir.mkdir(parents=True, exist_ok=True)

# Generate the current timestamp
current_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

# Define the filename as run.txt
filename = output_dir / "run.txt"

# Write the current timestamp into the file
with open(filename, 'w') as f:
    f.write(f"Pipeline run timestamp: {current_time}")
