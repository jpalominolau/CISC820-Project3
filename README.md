# CISC820 Project 3: Confidence Intervals

This code tests the 10 confidence intervals in `ci.m`.
It makes random datasets with values in [0, 1], gives them to `ci.m` and counts how many times the interval has the true mean.

## What you need

1. MATLAB or GNU Octave.
2. The file `ci.m` from the class. It is not in this repository. Copy `ci.m` into this folder before you run anything.

## Files

**generate_data.m** makes one random dataset. It can use 3 distributions: Uniform[0, 1], Bernoulli(0.5) and Bernoulli(0.01).

**coverage.m** calls `ci.m` many times and returns the fraction of times the interval has the true mean.

**run_all.m** runs `coverage.m` for the 10 functions, the 3 distributions and n = 10, 100, 1000 and 10000.

**probe.m** has small tests that show how each function behaves. The report uses them to explain the results.

**scan_worst.m** finds the lowest coverage for n from 1 to 20 and Bernoulli(p). `probe.m` uses it for functions 7 and 10.

**test_generate_data.m** checks that `generate_data.m` works.

**test_coverage.m** is a quick check that `coverage.m` works with the 10 functions.

**results.txt** is the output of `run_all.m`.

**probe_results.txt** is the output of `probe.m`.

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
