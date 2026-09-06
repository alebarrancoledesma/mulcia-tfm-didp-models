#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <folder>" >&2
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FOLDER="$(cd "$1" && pwd)"

shopt -s nullglob
input_files=("$FOLDER"/*.vrp)

if [[ ${#input_files[@]} -eq 0 ]]; then
    echo "No .vrp files found in: $FOLDER" >&2
    exit 1
fi

cd "$SCRIPT_DIR"

for input_file in "${input_files[@]}"; do
    base_name="$(basename "${input_file%.vrp}")"
    output_path="$FOLDER/$base_name.pddl"
    problem_pddl="$SCRIPT_DIR/problem.pddl"

    echo "Processing: $input_file"
    uv run python cvrp_to_pddl.py "$input_file"

    if [[ ! -f "$problem_pddl" ]]; then
        echo "problem.pddl was not generated for: $input_file" >&2
        exit 1
    fi

    mv -f "$problem_pddl" "$output_path"
    echo "Created: $output_path"
done
