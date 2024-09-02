import subprocess
import json
import numpy as np

def extract_model(problem_name, x_k=None):
    script_path = 'path to your julia script'

    # Prepare the command
    command = ['julia', script_path, problem_name]

    # If x_k is provided, add it to the command as a JSON-encoded string
    if x_k is not None:
        x_k_json = json.dumps(x_k.tolist())  # Convert numpy array to list and encode to JSON
        command.append(x_k_json)

    # Run the Julia script and capture its output
    result = subprocess.run(command, capture_output=True, text=True)

    # Check for errors
    if result.returncode != 0:
        print("Error running Julia script:", result.stderr)
        return None

    # Assuming output is JSON, parse it
    output = json.loads(result.stdout)
    
    return output
