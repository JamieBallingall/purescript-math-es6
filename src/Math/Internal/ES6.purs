module Math.Internal.ES6
  ( Radians
  , acosh,  acoshNative,  acoshPolyfill
  , asinh,  asinhNative,  asinhPolyfill
  , atanh,  atanhNative,  atanhPolyfill
  , cbrt,   cbrtNative,   cbrtPolyfill
  , clz32,  clz32Native,  clz32Polyfill
  , cosh,   coshNative,   coshPolyfill
  , expm1,  expm1Native,  expm1Polyfill
  , fround, froundNative, froundPolyfill
  , hypot,  hypotNative,  hypotPolyfill
  , hypot2, hypot2Native, hypot2Polyfill
  , imul,   imulNative,   imulPolyfill
  , log1p,  log1pNative,  log1pPolyfill
  , log2,   log2Native,   log2Polyfill
  , log10,  log10Native,  log10Polyfill
  , sinh,   sinhNative,   sinhPolyfill
  , sign,   signNative,   signPolyfill
  , tanh,   tanhNative,   tanhPolyfill
  , trunc,  truncNative,  truncPolyfill
  ) where

-- | An alias to make types in this module more explicit.
type Radians = Number

-- | Native version of `acosh`. For testing only, use `acosh`.
foreign import acoshNative :: Number -> Radians

-- | Polyfill for `acosh`. For testing only, use `acosh`.
foreign import acoshPolyfill :: Number -> Radians

-- | Returns the hyperbolic arc-cosine of a number. See
-- | [Math.acosh](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/acosh)
-- | on MDN.
foreign import acosh :: Number -> Radians

-- | Native version of `asinh`. For testing only, use `asinh`.
foreign import asinhNative :: Number -> Radians

-- | Polyfill for `asinh`. For testing only, use `asinh`.
foreign import asinhPolyfill :: Number -> Radians

-- | Returns the hyperbolic arcsine of a number. See
-- | [Math.asinh](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/asinh)
-- | on MDN.
foreign import asinh :: Number -> Radians

-- | Native version of `atanh`. For testing only, use `atanh`.
foreign import atanhNative :: Number -> Radians

-- | Polyfill for `atanh`. For testing only, use `atanh`.
foreign import atanhPolyfill :: Number -> Radians

-- | Returns the hyperbolic arctangent of a number. See
-- | [Math.atanh](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/atanh)
-- | on MDN.
foreign import atanh :: Number -> Radians

-- | Native version of `cbrt`. For testing only, use `cbrt`.
foreign import cbrtNative :: Number -> Number

-- | Polyfill for `cbrt`. For testing only, use `cbrt`.
foreign import cbrtPolyfill :: Number -> Number

-- | Returns the cube root of a number. See
-- | [Math.cbrt](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/cbrt)
-- | on MDN.
foreign import cbrt :: Number -> Number

-- | Native version of `clz32`. For testing only, use `clz32`.
foreign import clz32Native :: Int -> Int

-- | Polyfill for `clz32`. For testing only, use `clz32`.
foreign import clz32Polyfill :: Int -> Int

-- | Returns the number of leading zero bits in the 32-bit binary representation
-- | of a number.  See
-- | [Math.clz32](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/clz32)
-- | on MDN.
foreign import clz32 :: Int -> Int

-- | Native version of `cosh`. For testing only, use `cosh`.
foreign import coshNative :: Radians -> Number

-- | Polyfill for `cosh`. For testing only, use `cosh`.
foreign import coshPolyfill :: Radians -> Number

-- | Returns the hyperbolic cosine of a number. See
-- | [Math.cosh](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/cosh)
-- | on MDN.
foreign import cosh :: Radians -> Number

-- | Native version of `expm1`. For testing only, use `expm1`.
foreign import expm1Native :: Number -> Number

-- | Polyfill for `expm1`. For testing only, use `expm1`.
foreign import expm1Polyfill :: Number -> Number

-- | Returns `e^x - 1`, where `x` is the argument, and `e` the base of the
-- | natural logarithms. See
-- | [Math.expm1](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/expm1)
-- | on MDN.
foreign import expm1 :: Number -> Number

-- | Native version of `fround`. For testing only, use `fround`.
foreign import froundNative :: Number -> Number

-- | Polyfill for `fround`. For testing only, use `fround`.
foreign import froundPolyfill :: Number -> Number

-- | Returns the nearest 32-bit single precision float representation of a
-- | number. See
-- | [Math.fround](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/fround)
-- | on MDN.
foreign import fround :: Number -> Number

-- | Native version of `hypot`. For testing only, use `hypot`.
foreign import hypotNative :: Array Number -> Number

-- | Polyfill for `hypot`. For testing only, use `hypot`.
foreign import hypotPolyfill :: Array Number -> Number

-- | Returns the square root of the sum of squares of its arguments. See
-- | [Math.hypot](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/hypot)
-- | on MDN. The Javascript function `hypot` takes a variable number of
-- | arguments. This version takes an array of numbers. For the common case of
-- | two arguments, see `hypot2`.
foreign import hypot :: Array Number -> Number

-- | Native version of `hypot2`. For testing only, use `hypot2`.
foreign import hypot2Native :: Number -> Number -> Number

-- | Polyfill for `hypot2`. For testing only, use `hypot2`.
foreign import hypot2Polyfill :: Number -> Number -> Number

-- | Returns the square root of the sum of squares of its arguments. See
-- | [Math.hypot](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/hypot)
-- | on MDN. The Javascript function `hypot` takes a variable number of
-- | arguments. This version takes two arguments. For a function taking a
-- | variable number of arguments, in the form of an array, see `hypot`.
foreign import hypot2 :: Number -> Number -> Number

-- | Native version of `imul`. For testing only, use `imul`.
foreign import imulNative :: Int -> Int -> Int

-- | Polyfill for `imul`. For testing only, use `imul`.
foreign import imulPolyfill :: Int -> Int -> Int

-- | Returns the result of the C-like 32-bit multiplication of the two
-- | parameters. See
-- | [Math.imul](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/imul)
-- | on MDN.
foreign import imul :: Int -> Int -> Int

-- | Native version of `log1p`. For testing only, use `log1p`.
foreign import log1pNative :: Number -> Number

-- | Polyfill for `log1p`. For testing only, use `log1p`.
foreign import log1pPolyfill :: Number -> Number

-- | Returns the natural logarithm (base e) of 1 + a number. See
-- | [Math.log1p](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/log1p)
-- | on MDN.
foreign import log1p :: Number -> Number

-- | Native version of `log2`. For testing only, use `log2`.
foreign import log2Native :: Number -> Number

-- | Polyfill for `log2`. For testing only, use `log2`.
foreign import log2Polyfill :: Number -> Number

-- | Returns the base 2 logarithm of a number. See
-- | [Math.log2](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/log2)
-- | on MDN.
foreign import log2 :: Number -> Number

-- | Native version of `log10`. For testing only, use `log10`.
foreign import log10Native :: Number -> Number

-- | Polyfill for `log10`. For testing only, use `log10`.
foreign import log10Polyfill :: Number -> Number

-- | Returns the base 10 logarithm of a number. See
-- | [Math.log10](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/log10)
-- | on MDN.
foreign import log10 :: Number -> Number

-- | Native version of `sign`. For testing only, use `sign`.
foreign import signNative :: Number -> Number

-- | Polyfill for `sign`. For testing only, use `sign`.
foreign import signPolyfill :: Number -> Number

-- | Returns either a positive or negative +/- 1, indicating the sign of a
-- | number passed into the argument. If the number passed in is 0, it will
-- | return a +/- 0. See
-- | [Math.sign](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/sign)
-- | on MDN.
foreign import sign :: Number -> Number

-- | Native version of `sinh`. For testing only, use `sinh`.
foreign import sinhNative :: Number -> Number

-- | Polyfill for `sinh`. For testing only, use `sinh`.
foreign import sinhPolyfill :: Number -> Number

-- | Returns the hyperbolic sine of a number. See
-- | [Math.sinh](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/sinh)
-- | on MDN.
foreign import sinh :: Number -> Number

-- | Native version of `tanh`. For testing only, use `tanh`.
foreign import tanhNative :: Number -> Number

-- | Polyfill for `tanh`. For testing only, use `tanh`.
foreign import tanhPolyfill :: Number -> Number

-- | Returns the hyperbolic tangent of a number. See
-- | [Math.tanh](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/tanh)
-- | on MDN.
foreign import tanh :: Number -> Number

-- | Native version of `trunc`. For testing only, use `trunc`.
foreign import truncNative :: Number -> Int

-- | Polyfill for `trunc`. For testing only, use `trunc`.
foreign import truncPolyfill :: Number -> Int

-- | Returns the integer part of a number by removing any fractional digits. See
-- | [Math.trunc](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/trunc)
-- | on MDN.
foreign import trunc :: Number -> Int
