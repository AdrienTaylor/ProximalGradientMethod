# ProximalGradientMethod

This code can be used to reproduce the results from the work (on [arXiv](https://arxiv.org/pdf/1705.04398.pdf)):

> [1] Taylor, Adrien B., Julien M. Hendrickx, and François Glineur. "Exact worst-case convergence rates of the proximal gradient method for composite convex minimization." arXiv:1705.04398 (2017).

## Getting started

To use the code, download the repository and execute the scripts on a one-by-one basis.

**Notes:** 
- This code requires [YALMIP](https://yalmip.github.io/) along with a suitable SDP solver (e.g., Sedumi, SDPT3, Mosek).
- The files whose name starts with PESTO_* requires the installation of the Performance Estimation Toolbox ([PESTO](https://github.com/AdrienTaylor/Performance-Estimation-Toolbox)).

## Content

The repository contains:

(1) The symbolic validations for the main proofs contained in the work.
- [`Symbolic_Validations`](Symbolic_Validations.m) Symbolically verify the different proofs presented in the work (meant to be executed in 6 parts--one for each part of the three proofs presented).

(2) Numerical validations (using the Performance Estimation Toolbox PESTO) of the results of the last section (Mixed performance measures and sublinear convergence rates).
- [`PESTO_DistanceToFunctionValues`](PESTO_DistanceToFunctionValues.m) Numerically verifies the conjectured tight worst-case bound (for given values of the parameters N, mu and L) on the final objective function accuracy, from a bounded initial distance to optimality.
- [`PESTO_DistanceToGradient`](PESTO_DistanceToGradient.m)  Numerically verifies the conjectured tight worst-case bound (for given values of the parameters N, mu and L) on the final gradient norm, from a bounded initial distance to optimality.
- [`PESTO_FunctionValuesToDistance`](PESTO_FunctionValuesToDistance.m) Numerically verifies the conjectured tight worst-case bound (for given values of the parameters N, mu and L) on the final distance to optimality, from a bounded initial objective function accuracy.
- [`PESTO_FunctionValuesToGradient`](PESTO_FunctionValuesToGradient.m) Numerically verifies the conjectured tight worst-case bound (for given values of the parameters N, mu and L) on the final gradient norm, from a bounded initial objective function accuracy.
- [`PESTO_GradientToDistance`](PESTO_GradientToDistance.m) Numerically verifies the conjectured tight worst-case bound (for given values of the parameters N, mu and L) on the final distance to optimality, from a bounded initial gradient norm.
- [`PESTO_GradientToFunctionValues`](PESTO_GradientToFunctionValues.m) Numerically verifies the conjectured tight worst-case bound (for given values of the parameters N, mu and L) on the final objective function accuracy, from a bounded initial gradient norm.


## Authors
- [**Adrien Taylor**](http://www.di.ens.fr/~ataylor/)
- [**Julien Hendrickx**](https://perso.uclouvain.be/julien.hendrickx/index.html)
- [**François Glineur**](https://perso.uclouvain.be/francois.glineur/)
