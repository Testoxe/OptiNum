# Optinum

| **Documentation** | **Julia** |
|:-----------------:|:---------:|
| [![](https://img.shields.io/badge/docs-dev-blue.svg)](https://mathn7.github.io/Optinum/dev/index) | [![](https://img.shields.io/github/v/release/JuliaLang/julia.svg)](https://docs.julialang.org) |

## Numerical methods for minimizing a function  in Julia

### Constrained:
Implementation of algorithms to find solutions for the problem: ``\min _{x \in \mathbb{R}^{n}} f(x)`` where ``f`` is ``C^{2}`` in ``R^{n}``

1) Newton local algorithm
2) Trust regions method

### Unconstrained:
The problem now becomes: ``\min _{x \in \mathbb{R}^{n}} f(x)`` under the constraint ``x \in C`` in which C is a non empty subset of ``\mathbb{R}^{n}``

3) Augmented Lagragien method
