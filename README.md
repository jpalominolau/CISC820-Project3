# Confidence Interval

This code tests the 10 confidence intervals in `ci.m`.
It makes random datasets with values in [0, 1], gives them to `ci.m` and counts how many times the interval has the true mean.

## What you need

1. MATLAB or GNU Octave.
2. The `ci.m` file given in class. It is not included, so copy it into the root folder of the project.

## Files

| File | What it does |
|---|---|
| `generate_data.m` | Makes one random dataset from Uniform[0, 1], Bernoulli(0.5) or Bernoulli(0.01) |
| `coverage.m` | Calls `ci.m` many times and returns the fraction of times the interval has the true mean |
| `run_all.m` | Runs `coverage.m` for the 10 functions, the 3 distributions and n = 10, 100, 1000 and 10000 |
| `probe.m` | Small tests that show how each function behaves |
| `scan_worst.m` | Finds the lowest coverage for n from 1 to 20 and Bernoulli(p), used by `probe.m` |
| `test_generate_data.m` | Checks that `generate_data.m` works |
| `test_coverage.m` | Quick check that `coverage.m` works with the 10 functions |
| `results.txt` | Output of `run_all.m` |
| `probe_results.txt` | Output of `probe.m` |

## How to run

1. Open MATLAB or Octave in this folder.
2. Type `run_all` and press Enter. It takes about 3 minutes.
3. Type `probe` and press Enter. It takes about 2 minutes.

From a terminal with Octave you can also type:

```
octave run_all.m
octave probe.m
```

## How to read the output of run_all

It prints one table for each distribution.
Each row is one function of `ci.m`.
The first number is the function number.
The next 4 numbers are the coverage for n = 10, 100, 1000 and 10000.
For example 0.95 means the interval had the true mean 95% of the time.

## How to test another ci.m

Replace `ci.m` with the new file and run `run_all` again.
The data is random, so the numbers change a little each time.
