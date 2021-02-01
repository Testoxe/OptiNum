# Optinum

| **Documentation** | **Julia** |
|:-----------------:|:---------:|
| [![](https://img.shields.io/badge/docs-dev-blue.svg)](https://mathn7.github.io/Optinum/dev/index) | [![](https://img.shields.io/github/v/release/JuliaLang/julia.svg)](https://docs.julialang.org) |

## Numerical methods for minimizing a function  in Julia

### Constrained:
Implementation of algorithms to find solutions for the problem: ![equation](https://latex.codecogs.com/gif.latex?%5Cmin%20_%7Bx%20%5Cin%20%5Cmathbb%7BR%7D%5E%7Bn%7D%7D%20f%28x%29) where f is ![equation](https://latex.codecogs.com/gif.latex?C%5E%7B2%7D) in ![equation](https://latex.codecogs.com/gif.latex?R%5E%7Bn%7D)

1) Newton local algorithm
2) Trust regions method

### Unconstrained:
Same problem: ![equation](https://latex.codecogs.com/gif.latex?%5Cmin%20_%7Bx%20%5Cin%20%5Cmathbb%7BR%7D%5E%7Bn%7D%7D%20f%28x%29) but under the constraint ![equation](https://latex.codecogs.com/gif.latex?x%20%5Cin%20C) in which C is a non empty subset of ![equation](https://latex.codecogs.com/gif.latex?%5Cmathbb%7BR%7D%5E%7Bn%7D)

3) Augmented Lagragien method
