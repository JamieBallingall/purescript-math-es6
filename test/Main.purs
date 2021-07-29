module Test.Main where

import Prelude

import Effect (Effect)
import Effect.Class.Console (log)
import Math.Internal.ES6
  ( acoshNative,  acoshPolyfill
  , asinhNative,  asinhPolyfill
  , atanhNative,  atanhPolyfill
  , cbrtNative,   cbrtPolyfill
  , clz32Native,  clz32Polyfill
  , coshNative,   coshPolyfill
  , expm1Native,  expm1Polyfill
  , froundNative, froundPolyfill
  , hypotNative,  hypotPolyfill
  , hypot2Native, hypot2Polyfill
  , imulNative,   imulPolyfill
  , log1pNative,  log1pPolyfill
  , log2Native,   log2Polyfill
  , log10Native,  log10Polyfill
  , signNative,   signPolyfill
  , sinhNative,   sinhPolyfill
  , tanhNative,   tanhPolyfill
  , truncNative,  truncPolyfill
  )

main :: Effect Unit
main = do
  log $ "Below are very basic tests to check that the native functions " <>
        "and the polyfill functions give similar results. Numbers represent " <>
        "the difference between the native and polyfill version and should " <>
        "be equal to or near zero"
  log $ "acosh: " <> show (acoshNative 2.0 - acoshPolyfill 2.0)
  log $ "asinh: " <> show (asinhNative 2.0 - asinhPolyfill 2.0)
  log $ "atanh: " <> show (atanhNative 0.5 - atanhPolyfill 0.5)
  log $ "cbrt: " <> show (cbrtNative 2.0 - cbrtPolyfill 2.0)
  log $ "clz32: " <> show (clz32Native 1001 - clz32Polyfill 1001)
  log $ "cosh: " <> show (coshNative 2.0 - coshPolyfill 2.0)
  log $ "expm1: " <> show (expm1Native 2.0 - expm1Polyfill 2.0)
  log $ "fround: " <> show (froundNative 2.0 - froundPolyfill 2.0)
  log $ "hypot: " <> show (hypotNative [2.0, 3.0] - hypotPolyfill [2.0, 3.0])
  log $ "hypot2: " <> show (hypot2Native 2.0 3.0 - hypot2Polyfill 2.0 3.0)
  log $ "imul: " <> show (imulNative 2 (-3) - imulPolyfill 2 (-3))
  log $ "log1p: " <> show (log1pNative 2.0  - log1pPolyfill 2.0)
  log $ "log2: " <> show (log2Native 2.0  - log2Polyfill 2.0)
  log $ "log10: " <> show (log10Native 2.0  - log10Polyfill 2.0)
  log $ "sign: " <> show (signNative (-2.0) - signPolyfill (-2.0))
  log $ "sinh: " <> show (sinhNative 2.0 - sinhPolyfill 2.0)
  log $ "tanh: " <> show (tanhNative 0.5 - tanhPolyfill 0.5)
  log $ "trunc: " <> show (truncNative 5.5 - truncPolyfill 5.5)
