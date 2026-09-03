# Step 9 of the generate/ pipeline.
# Write a pipeline run timestamp marker to tools/run.txt.
# Used as a simple record of the last generator execution time.
# Path is relative to the repo root (not this script's own directory), so
# run.txt stays at tools/run.txt regardless of which generate/ step writes it.

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
