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

foreign import acoshNative :: Number -> Radians

foreign import acoshPolyfill :: Number -> Radians

foreign import acosh :: Number -> Radians

foreign import asinhNative :: Number -> Radians

foreign import asinhPolyfill :: Number -> Radians

foreign import asinh :: Number -> Radians

foreign import atanhNative :: Number -> Radians

foreign import atanhPolyfill :: Number -> Radians

foreign import atanh :: Number -> Radians

foreign import cbrtNative :: Number -> Number

foreign import cbrtPolyfill :: Number -> Number

foreign import cbrt :: Number -> Number

foreign import clz32Native :: Int -> Int

foreign import clz32Polyfill :: Int -> Int

foreign import clz32 :: Int -> Int

foreign import coshNative :: Radians -> Number

foreign import coshPolyfill :: Radians -> Number

foreign import cosh :: Radians -> Number

foreign import expm1Native :: Number -> Number

foreign import expm1Polyfill :: Number -> Number

foreign import expm1 :: Number -> Number

foreign import froundNative :: Number -> Number

foreign import froundPolyfill :: Number -> Number

foreign import fround :: Number -> Number

foreign import hypotNative :: Array Number -> Number

foreign import hypotPolyfill :: Array Number -> Number

foreign import hypot :: Array Number -> Number

foreign import hypot2Native :: Number -> Number -> Number

foreign import hypot2Polyfill :: Number -> Number -> Number

foreign import hypot2 :: Number -> Number -> Number

foreign import imulNative :: Int -> Int -> Int

foreign import imulPolyfill :: Int -> Int -> Int

foreign import imul :: Int -> Int -> Int

foreign import log1pNative :: Number -> Number

foreign import log1pPolyfill :: Number -> Number

foreign import log1p :: Number -> Number

foreign import log2Native :: Number -> Number

foreign import log2Polyfill :: Number -> Number

foreign import log2 :: Number -> Number

foreign import log10Native :: Number -> Number

foreign import log10Polyfill :: Number -> Number

foreign import log10 :: Number -> Number

foreign import signNative :: Number -> Number

foreign import signPolyfill :: Number -> Number

foreign import sign :: Number -> Number

foreign import sinhNative :: Number -> Number

foreign import sinhPolyfill :: Number -> Number

foreign import sinh :: Number -> Number

foreign import tanhNative :: Number -> Number

foreign import tanhPolyfill :: Number -> Number

foreign import tanh :: Number -> Number

foreign import truncNative :: Number -> Int

foreign import truncPolyfill :: Number -> Int

foreign import trunc :: Number -> Int
