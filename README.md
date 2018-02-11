# Rtweedie

This package provides an interface to the `tweedie` package in R. Currently only a `Tweedie` type (in Julia) and a function that calls `rtweedie` (in R) to generate single random draws or vectors of draws and return them as the appropriate Julia objects. This utilizes the `RCall.jl` package.

## Future work

- Implement an interface to the rest of the `tweedie` package.
- Implement an interface to the `Tweedie` type consistent with the `Distributions.jl` package.
- Reimplement all of this code in Julia.
