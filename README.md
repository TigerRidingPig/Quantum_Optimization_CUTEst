# CUTEst Julia Interface Python Wrapper

This repository provides a Python wrapper to interact with the CUTEst optimization problems using a Julia backend. The wrapper allows users to extract model information such as the objective function value, gradient, and Hessian for a given problem name, with an optional initial guess for the variables.

## Prerequisites

- Python 3.x
- Julia 1.x
- Required Julia packages: `CUTEst`, `NLPModels`, `JSON`, `ArgParse`

## Installation

1. Install the necessary Python packages:

   ```bash
   pip install numpy
   ```

2. Install the required Julia packages by running the following commands in the Julia REPL:

   ```julia
   using Pkg
   Pkg.add("CUTEst")
   Pkg.add("NLPModels")
   Pkg.add("JSON")
   Pkg.add("ArgParse")
   ```

## Usage

### Python Script

The `extract_model` function in the Python script allows you to call the Julia script and extract model information.

```python
import numpy as np
from extract_model import extract_model

# Example usage
problem_name = "HS25"
x_k = np.array([1.0, 2.0, 3.0])

output = extract_model(problem_name, x_k)
print(output)
```

### Julia Script

The Julia script `Julia_script.jl` is executed by the Python wrapper and handles the interaction with the CUTEst problem.

### Functionality

- `problem_name`: Name of the CUTEst problem to be loaded.
- `x_k`: (Optional) A numpy array representing the initial guess for the variables.

### Output

The output is a JSON object containing:

- `nlp`: The NLP model information.
- `fx`: The objective function value at `x_k`.
- `gx`: The gradient at `x_k`.
- `Hx`: The Hessian at `x_k`.

### Error Handling

If the Julia script encounters any issues, the Python wrapper will return `None` and print the error message.

## License

This project is licensed under the MIT License.