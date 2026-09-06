# Models for the DIDP Papers

This repository stores DyPDL, MIP, and CP models used in the following papers.

## Setup (uv)

Requires [uv](https://docs.astral.sh/uv/). From the repository root:

```bash
# Core dependencies (DIDP models, YAML conversion, graph generators)
uv sync

# Include MIP (Gurobi) and CP (IBM CP Optimizer) solvers
uv sync --extra all
```

Run scripts from the corresponding problem directory (each folder has local imports):

```bash
cd cvrp
uv run python cvrp_didp.py instance-k4.txt --config LNBS --history history.csv --time-out 1800
```

Note: `gurobipy` and `docplex` require separate commercial solver licenses. The `didp-yaml` binary and other external tools referenced in subfolder READMEs are not managed by uv.

- Kuroiwa and Beck 2023 CAASDy: Ryo Kuroiwa and J. Christopher Beck. [Domain-Independent Dynamic Programming: Generic State Space Search for Combinatorial Optimization.](https://ojs.aaai.org/index.php/ICAPS/article/view/27200/26973) In Proceedings of the 33rd International Conference on Automated Planning and Scheduling (ICAPS). 2023. [supplement](https://tidel.mie.utoronto.ca/pubs/Appendix_CAASDy_ICAPS23.pdf)
- Kuroiwa and Beck 2023 Anytime: Ryo Kuroiwa and J. Christopher Beck. [Solving Domain-Independent Dynamic Programming Problems with Anytime Heuristic Search.](https://tidel.mie.utoronto.ca/pubs/Appendix_Anytime_ICAPS23.pdf) In Proceedings of the 33rd International Conference on Automated Planning and Scheduling (ICAPS). 2023. [supplement](https://tidel.mie.utoronto.ca/pubs/Appendix_Anytime_ICAPS23.pdf)
- Kuroiwa and Beck 2023 LNBS: Ryo Kuroiwa and J. Christopher Beck. [Large Neighborhood Beam Search for Domain-Independent Dynamic Programming.](https://drops.dagstuhl.de/opus/volltexte/2023/19060/pdf/LIPIcs-CP-2023-23.pdf) In Proceedings of the 29th International Conference on Principles and Practice of Constraint Programming (CP). 2023.
- Kuroiwa and Beck 2024 Parallel: Ryo Kuroiwa and J. Christopher Beck. [Parallel Beam Search Algorithms for Domain-Independent Dynamic Programming.](https://tidel.mie.utoronto.ca/pubs/aaai24-parallel-camera-ready.pdf) In Proceedings of the 38th Annual AAAI Conference on Artificial Intelligence (AAAI). 2024. [supplement](https://tidel.mie.utoronto.ca/pubs/Appendix_Parallel_AAAI24.pdf)
- Journal submission

In addition, PDDL models for some problems and Picat models are provided.

## More Models

The discrete-optimization repository maintained by airbus also implement DP models for multiple problems using DIDPPy: https://github.com/airbus/discrete-optimization
