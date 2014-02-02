(function() {
  var colorContainers, colorInputs, colorValues, onReady, resultContainer, setValues, _id;

  colorInputs = [];

  colorValues = [];

  colorContainers = [];

  resultContainer = null;

  _id = function(id) {
    return document.getElementById(id);
  };

  setValues = function(reportResult) {
    var resultValue;
    if (reportResult == null) {
      reportResult = true;
    }
    colorValues[0] = colorInputs[0].value;
    colorValues[1] = colorInputs[1].value;
    resultValue = mix(colorValues[0], colorValues[1]);
    colorContainers[0].style.backgroundColor = colorValues[0];
    colorContainers[1].style.backgroundColor = colorValues[1];
    document.body.style.backgroundColor = resultValue;
    if (reportResult) {
      return resultContainer.innerHTML = resultValue;
    }
  };

  onReady = function() {
    colorInputs[0] = _id("color1-input");
    colorInputs[1] = _id("color2-input");
    colorContainers[0] = _id("color1");
    colorContainers[1] = _id("color2");
    resultContainer = _id("result");
    setValues(false);
    colorInputs[0].addEventListener("change", setValues);
    return colorInputs[1].addEventListener("change", setValues);
  };

  window.addEventListener("DOMContentLoaded", onReady);

}).call(this);

(function() {
  var diff, mix, toHex, toRgb;

  toRgb = function(hexColor) {
    var color;
    hexColor = hexColor.replace("#", "");
    if (hexColor.length === 3) {
      hexColor = hexColor.split("");
      hexColor = (function() {
        var _i, _len, _results;
        _results = [];
        for (_i = 0, _len = hexColor.length; _i < _len; _i++) {
          color = hexColor[_i];
          _results.push(color + color);
        }
        return _results;
      })();
    } else {
      hexColor = hexColor.match(/.{2}/g);
    }
    return {
      r: parseInt(hexColor[0], 16),
      g: parseInt(hexColor[1], 16),
      b: parseInt(hexColor[2], 16)
    };
  };

  toHex = function(rgbColor) {
    var b, g, r;
    r = rgbColor.r.toString(16);
    g = rgbColor.g.toString(16);
    b = rgbColor.b.toString(16);
    if (r.length === 1) {
      r = "0" + r;
    }
    if (g.length === 1) {
      g = "0" + g;
    }
    if (b.length === 1) {
      b = "0" + b;
    }
    return "#" + r + g + b;
  };

  diff = function(a, b, amount) {
    var x;
    if (a > b) {
      x = a;
      a = b;
      b = x;
      amount = 1 - amount;
    }
    return Math.round(Math.abs(amount * (a - b))) + a;
  };

  mix = function(color1, color2, amount) {
    var color3;
    if (amount == null) {
      amount = 0.5;
    }
    color1 = toRgb(color1);
    color2 = toRgb(color2);
    color3 = {
      r: diff(color1.r, color2.r, amount),
      g: diff(color1.g, color2.g, amount),
      b: diff(color1.b, color2.b, amount)
    };
    return toHex(color3);
  };

  window.mix = mix;

}).call(this);
