# CVRP

- [Benchmark instance-k4s](http://vrp.atd-lab.inf.puc-rio.br/index.php/en/)

The instance file must contain `k{#vehicles}` in its name.

## PDDL conversion

Convert all `.vrp` files in a folder to PDDL problem files (uses `domain.pddl` in this directory):

```powershell
.\convert_vrp_to_pddl.ps1 C:\path\to\folder
```

For each `instance-k4.vrp`, the script writes `instance-k4.pddl` in the same folder. Requires [uv](../README.md#setup-uv) from the repository root.

Manual conversion of a single instance:

```python3
uv run python cvrp_to_pddl.py instance-k4.vrp
```

```python3
python3 cvrp_mip.py instance-k4.txt --history history.csv --time-out 1800
```

```python3
python3 cvrp_cp.py instance-k4.txt --history history.csv --time-out 1800
```

## Kuroiwa and Beck 2023 CAASDy

```python3
python3 cvrp_to_didp.py instance-k4.txt -d didp-yaml -c ../configs/caasdy.yaml --memory-limit 8192
```

- `-d`: didp-yaml binary
- `-c`: config YAML file

## Kuroiwa and Beck 2023 Anytime

```python3
python3 cvrp_to_didp.py instance-k4.txt --use-bound -d didp-yaml -c ../configs/cabs.yaml --memory-limit 8192
```

## Kuroiwa and Beck 2023 LNBS

```python3
python3 cvrp_didp.py instance-k4.txt --config LNBS --history history.csv --time-out 1800
```

- `--config`: Solver name

## Kuroiwa and Beck 2024 Parallel

```python3
python3 cvrp_didp.py instance-k4.txt --config CABS --initial-beam-size 32 --threads 4 --parallel-type 0 --history history.csv --time-out 300
```

- `--threads`: Number of threads
- `--parallel-type`
  - `0`: HDBS2
  - `1`: HDBS1
  - `2`: SBS

## Journal Submission

```python3
python3 cvrp_to_didp.py instance-k4.txt --use-bound --non-zero-base-case -d didp-yaml -c ../configs/cabs.yaml --memory 8192
```

### CABS/0

```python3
python3 cvrp_to_didp.py instance-k4.txt --non-zero-base-case -d didp-yaml -c ../configs/cabs.yaml --memory 8192
```
