# purescript-math-es6

Currently [purescript-math](https://github.com/purescript/purescript-math) has
limited support for the functions added to the Javascript `Math` object in ES6.
This library implements the missing functions and also provides polyfills for
them.

Specifically, the functions `acosh`, `asinh`, `atanh`, `cbrt`, `clz32`, `cosh`,
`expm1`, `fround`, `hypot`, `hypot2`, `imul`, `log1p`, `log2`, `log10`, `sinh`,
`sign`, `tanh`, and `trunc` are available. Each function has three versions.

| Function name | Example | Description |
| ---           | ---     | ---         |
| `x`           | `acosh` | The production version of the function and the only one exported from this library. Uses the native version where possible and the polyfill otherwise |
| `xPolyfill`   | `acoshPolyfill` | A polyfill for `x`. Do not use directly. Is available as a seperate function for testing |
| `xNative`     | `acoshNative` | A version without a polyfill. Do not use directly. Is available as a reference against which to test the polyfill |
