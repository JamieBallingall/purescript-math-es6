"use strict";

// acosh -----------------------------------------------------------------------
// See https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/acosh
exports.acoshNative = Math.acosh;

// MDN provides an unreliable polyfill in the form of:
//   Math.log(x + Math.sqrt(x * x - 1))
// This overflows for large values of x. To avoid this we implement acosh in
// terms of asinh (for which MDN provides a robust polyfill) using the identity:
//   2 * asinh(x) == acosh(2*x^2 + 1)
// see https://en.wikipedia.org/wiki/Inverse_hyperbolic_functions#Other_identities
// Rewriting gives:
//   cosh(x) = 2 * asinh(sqrt((x - 1) / 2))
// which is used below.
exports.acoshPolyfill = function(x) {
  return 2 * exports.asinhPolyfill(Math.sqrt((x - 1) / 2));
};

exports.acosh = Math.acosh ? Math.acosh : exports.acoshPolyfill;

// asinh -----------------------------------------------------------------------
// See https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/asinh
exports.asinhNative = Math.asinh;

// Polyfill from MDN
exports.asinhPolyfill = function(x) {
  var absX = Math.abs(x), w
  if (absX < 3.725290298461914e-9) // |x| < 2^-28
      return x
  if (absX > 268435456) // |x| > 2^28
      w = Math.log(absX) + Math.LN2
  else if (absX > 2) // 2^28 >= |x| > 2
      w = Math.log(2 * absX + 1 / (Math.sqrt(x * x + 1) + absX))
  else
      var t = x * x, w = Math.log1p(absX + t / (1 + Math.sqrt(1 + t)))

  return x > 0 ? w : -w
};

exports.asinh = Math.asinh ? Math.asinh : exports.asinhPolyfill;

// atanh -----------------------------------------------------------------------
// See https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/atanh
exports.atanhNative = Math.atanh;

// Polyfill from MDN
exports.atanhPolyfill = function(x) {
  return Math.log((1+x)/(1-x)) / 2;
};

exports.atanh = Math.atanh ? Math.atanh : exports.atanhPolyfill;

// cbrt ------------------------------------------------------------------------
// See https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/cbrt
exports.cbrtNative = Math.cbrt;

// Polyfill from MDN
exports.cbrtPolyfill = (function(pow) {
    return function cbrt(x){
      // ensure negative numbers remain negative:
      return x < 0 ? -pow(-x, 1/3) : pow(x, 1/3);
    };
  })(Math.pow); // localize Math.pow to increase efficiency

exports.cbrt = Math.cbrt ? Math.cbrt : exports.cbrtPolyfill;

// clz32 -----------------------------------------------------------------------
// See https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/clz32
exports.clz32Native = Math.clz32;

exports.clz32Polyfill = (function(log, LN2){
  return function(x) {
    // Let n be ToUint32(x).
    // Let p be the number of leading zero bits in
    // the 32-bit binary representation of n.
    // Return p.
    var asUint = x >>> 0;
    if (asUint === 0) {
      return 32;
    }
    return 31 - (log(asUint) / LN2 | 0) |0; // the "| 0" acts like math.floor
  };
})(Math.log, Math.LN2);

exports.clz32 = Math.clz32 ? Math.clz32 : exports.clz32Polyfill;

// cosh ------------------------------------------------------------------------
// See https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/cosh
exports.coshNative = Math.cosh;

// Polyfill from MDN
exports.coshPolyfill = function(x) {
  var y = Math.exp(x);
  return (y + 1 / y) / 2;
};

exports.cosh = Math.cosh ? Math.cosh : exports.coshPolyfill;

// expm1 -----------------------------------------------------------------------
// See https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/expm1
exports.expm1Native = Math.expm1;

// MDN does not provide a polyfill, so we do the obvious one based on the
// definition
exports.expm1Polyfill = function(x) {
  return Math.exp(x) - 1;
};

exports.expm1 = Math.expm1 ? Math.expm1 : exports.expm1Polyfill;

// fround ----------------------------------------------------------------------
// See https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/fround
exports.froundNative = Math.fround;

// Polyfill from MDN
exports.froundPolyfill = (function (array) {
  return function(x) {
    return array[0] = x, array[0];
  };
})(new Float32Array(1));

exports.fround = Math.fround ? Math.fround : exports.froundPolyfill;

// hypot -----------------------------------------------------------------------
// See https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/hypot

// hypotNative needs to take an array so we provide a wrapper that converts
// the array into an argument list
exports.hypotNative = function (array) {
  return Math.hypot(...array);
  // The ... operator was introduced in ES6. It should exist anytime Math.hypot
  // is defined. If Math.hypot does not exist you will be calling hypotPolyfill
  // anyway
};

// Polyfill based on MDN, with small alterations to take an array rather than
// an argument list
exports.hypotPolyfill = function (array) { // Explicit argument `array` added
  var max = 0;
  var s = 0;
  var containsInfinity = false;
  for (var i = 0; i < array.length; ++i) { // `arguments` replaced with `array`
    var arg = Math.abs(array[i]); // `Number(arguments[i])` replaced with `array[i]`
    if (arg === Infinity)
      containsInfinity = true
    if (arg > max) {
      s *= (max / arg) * (max / arg);
      max = arg;
    }
    s += arg === 0 && max === 0 ? 0 : (arg / max) * (arg / max);
  }
  return containsInfinity ? Infinity : (max === 1 / 0 ? 1 / 0 : max * Math.sqrt(s));
};

exports.hypot = Math.hypot ? exports.hypotNative : exports.hypotPolyfill;

// hypot2 ----------------------------------------------------------------------
// A more efficient and convenient function for calls to hypot with only two
// elements in the array. So `hypot2(2)(3) = hypot([2, 3])`
exports.hypot2Native = function (x) {
  return function (y) {
    return Math.hypot(x, y);
  };
};

// This is the function hypotPolyfill from above with the loop unwound and
// specialized to x and y rather than arg
exports.hypot2Polyfill = function (x) {
  return function (y) {
    var max = 0;
    var s = 0;
    var containsInfinity = false;

    if (x === Infinity)
      containsInfinity = true
    if (x > max) {
      s *= (max / x) * (max / x);
      max = x;
    }
    s += x === 0 && max === 0 ? 0 : (x / max) * (x / max);

    if (y === Infinity)
      containsInfinity = true
    if (y > max) {
      s *= (max / y) * (max / y);
      max = y;
    }
    s += y === 0 && max === 0 ? 0 : (y / max) * (y / max);

    return containsInfinity ? Infinity : (max === 1 / 0 ? 1 / 0 : max * Math.sqrt(s));
  };
};

exports.hypot2 = Math.hypot ? exports.hypot2Native : exports.hypot2Polyfill;

// imul ------------------------------------------------------------------------
// See https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/imul

// imul takes two arguments, so a curried wrapper is required
exports.imulNative = function (opA) {
  return function (opB) {
    return Math.imul(opA, opB);
  };
};

// Polyfill directly from MDN, converted to curried
exports.imulPolyfill = function(opA) {
  return function (opB) {
    opB |= 0; // ensure that opB is an integer. opA will automatically be coerced.
    // floating points give us 53 bits of precision to work with plus 1 sign bit
    // automatically handled for our convienence:
    // 1. 0x003fffff /*opA & 0x000fffff*/ * 0x7fffffff /*opB*/ = 0x1fffff7fc00001
    //    0x1fffff7fc00001 < Number.MAX_SAFE_INTEGER /*0x1fffffffffffff*/
    var result = (opA & 0x003fffff) * opB;
    // 2. We can remove an integer coersion from the statement above because:
    //    0x1fffff7fc00001 + 0xffc00000 = 0x1fffffff800001
    //    0x1fffffff800001 < Number.MAX_SAFE_INTEGER /*0x1fffffffffffff*/
    if (opA & 0xffc00000 /*!== 0*/) result += (opA & 0xffc00000) * opB |0;
    return result |0;
  };
};

exports.imul = Math.imul ? exports.imulNative : exports.imulPolyfill;

// log1p -----------------------------------------------------------------------
// See https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/log1p
exports.log1pNative = Math.log1p;

// MDN does not supply a polyfill so we implement the obvious one based on the
// definition
exports.log1pPolyfill = function (x) {
  return Math.log(x + 1);
}

exports.log1p = Math.log1p ? Math.log1p : exports.log1pPolyfill;

// log2 ------------------------------------------------------------------------
// See https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/log2
exports.log2Native = Math.log2;

// Polyfill from MDN
exports.log2Polyfill = function(x) {
  return Math.log(x) * Math.LOG2E;
};

exports.log2 = Math.log2 ? Math.log2 : exports.log2Polyfill;

// log10 -----------------------------------------------------------------------
// See https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/log10
exports.log10Native = Math.log10;

// Polyfill from MDN
exports.log10Polyfill = function(x) {
  return Math.log(x) * Math.LOG10E;
};

exports.log10 = Math.log10 ? Math.log10 : exports.log10Polyfill;

// sign ------------------------------------------------------------------------
// See https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/sign
exports.signNative = Math.sign;

// MDN does not provide a polyfill. We implement a simple one below, taking care
// to ensure the correct return values for -0, +0 and NaN. The `x !== x` test
// checks for NaN in a way that is likely to work reliabily in older browsers
exports.signPolyfill = function(x) {
  return x === 0 || x !== x ? x : (x < 0 ? -1 : 1);
}

exports.sign = Math.sign ? Math.sign : exports.signPolyfill;

// sinh ------------------------------------------------------------------------
// See https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/sinh
exports.sinhNative = Math.sinh;

// Polyfill from MDN
exports.sinhPolyfill = function(x) {
  var y = Math.exp(x);
  return (y - 1 / y) / 2;
};

exports.sinh = Math.sinh ? Math.sinh : exports.sinhPolyfill;

// tanh ------------------------------------------------------------------------
// See https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/tanh
exports.tanhNative = Math.tanh;

exports.tanhPolyfill = function(x) {
  var a = Math.exp(+x), b = Math.exp(-x);
  return a == Infinity ? 1 : b == Infinity ? -1 : (a - b) / (a + b);
}

exports.tanh = Math.tanh ? Math.tanh : exports.tanhPolyfill;

// trunc -----------------------------------------------------------------------
// See https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/trunc
exports.truncNative = Math.trunc;

exports.truncPolyfill = function(x) {
  return x === 0 ? x : (x < 0 ? Math.ceil(x) : Math.floor(x));
};

exports.trunc = Math.trunc ? Math.trunc : exports.truncPolyfill;
