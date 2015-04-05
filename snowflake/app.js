(function() {
  var attachEvents, calculatePercentageForRange, canvas, createFlake, currentFlakeRate, currentFlakeSize, flakeRateInterval, flakeRateRange, flakeSizeRange, rateInput, rateInputChangeHandler, setCurrentFlakeRate, setCurrentFlakeSize, sizeInput, sizeInputChangeHandler, startFlakeRateInterval;

  canvas = null;

  sizeInput = null;

  rateInput = null;

  flakeRateInterval = null;

  flakeSizeRange = [-2, 20];

  flakeRateRange = [5, 500];

  currentFlakeSize = null;

  currentFlakeRate = null;

  createFlake = function(size) {
    var flake, position, timing;
    if (size == null) {
      size = 0;
    }
    position = [-10, randRange(0, canvas.scrollWidth)];
    timing = randRange(50, 200);
    size = randRange(3 + size, 8 + size);
    flake = new Snowflake(position, timing, size);
    canvas.appendChild(flake.element);
    flake.animate();
    return flake.onDestruct = function() {
      return canvas.removeChild(flake.element);
    };
  };

  startFlakeRateInterval = function() {
    if (flakeRateInterval !== null) {
      clearInterval(flakeRateInterval);
    }
    return flakeRateInterval = setInterval(function() {
      return createFlake(currentFlakeSize);
    }, currentFlakeRate);
  };

  calculatePercentageForRange = function(range, percent) {
    return Math.round(Math.abs(percent * (range[0] - range[1]))) + range[0];
  };

  setCurrentFlakeSize = function() {
    var percent;
    percent = parseInt(sizeInput.value, 10) / 100;
    return currentFlakeSize = calculatePercentageForRange(flakeSizeRange, percent);
  };

  setCurrentFlakeRate = function() {
    var percent;
    percent = parseInt(rateInput.value, 10) / 100;
    return currentFlakeRate = calculatePercentageForRange(flakeRateRange, percent);
  };

  sizeInputChangeHandler = function() {
    setCurrentFlakeSize();
    return startFlakeRateInterval();
  };

  rateInputChangeHandler = function() {
    setCurrentFlakeRate();
    return startFlakeRateInterval();
  };

  attachEvents = function() {
    sizeInput.addEventListener("change", sizeInputChangeHandler);
    return rateInput.addEventListener("change", rateInputChangeHandler);
  };

  window.addEventListener("DOMContentLoaded", function() {
    canvas = document.getElementById("canvas");
    sizeInput = document.getElementById("size-input");
    rateInput = document.getElementById("rate-input");
    setCurrentFlakeSize();
    setCurrentFlakeRate();
    attachEvents();
    return startFlakeRateInterval();
  });

}).call(this);

(function() {
  var Snowflake, randRange;

  randRange = function(a, b) {
    return ~~(Math.random() * (b - a + 1)) + a;
  };

  Snowflake = (function() {
    function Snowflake(position, timing, size) {
      this.speed = [0, 0];
      this.position = position;
      this.timing = timing;
      size = size;
      this.element = document.createElement("div");
      this.element.setAttribute("class", "flake");
      this.element.style.width = "" + size + "px";
      this.element.style.height = "" + size + "px";
      this.setSpeed();
      this.setPosition();
      this.destructed = false;
    }

    Snowflake.prototype.setSpeed = function() {
      this.speed[0] = randRange(-1, 4);
      return this.speed[1] = randRange(-2, 2);
    };

    Snowflake.prototype.setPosition = function() {
      if (this.maxHeight === null) {
        this.maxHeight = this.element.parentElement.clientHeight || 500;
      }
      if (this.position[0] > this.maxHeight) {
        this.destruct();
      }
      if (this.destructed) {
        return;
      }
      this.position[0] = this.position[0] + this.speed[0];
      this.position[1] = this.position[1] + this.speed[1];
      this.element.style.top = "" + this.position[0] + "px";
      return this.element.style.left = "" + this.position[1] + "px";
    };

    Snowflake.prototype.animate = function() {
      return this.interval = setInterval((function(_this) {
        return function() {
          _this.setSpeed();
          return _this.setPosition();
        };
      })(this), this.timing);
    };

    Snowflake.prototype.onDestruct = function() {};

    Snowflake.prototype.destruct = function() {
      this.destructed = true;
      clearInterval(this.interval);
      return this.onDestruct();
    };

    return Snowflake;

  })();

  window.randRange = randRange;

  window.Snowflake = Snowflake;

}).call(this);
