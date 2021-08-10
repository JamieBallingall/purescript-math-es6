# purescript-math-es6

Currently [purescript-math](https://github.com/purescript/purescript-math) has
limited support for the functions added to the Javascript `Math` object in ES6.
This library implements the missing functions and also provides polyfills for
them.

Specifically, the functions `acosh`, `asinh`, `atanh`, `cbrt`, `clz32`, `cosh`,
`expm1`, `fround`, `hypot`, `hypot2`, `imul`, `log1p`, `log2`, `log10`, `sinh`,
`sign`, `tanh`, and `trunc` are available. Between
[purescript-math](https://github.com/purescript/purescript-math)
and this library all the methods and properties of the Javascript Math object
are available except `Math.random()`.

Polyfill quality is generally good. See the project
[purescript-math-es6-quality](https://github.com/JamieBallingall/purescript-math-es6-quality)
for comparisons of native and polyfill functions.
