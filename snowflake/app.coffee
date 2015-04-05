# snowflake container
canvas = null

# slider input elements
sizeInput = null
rateInput = null

# snowflake creation interval
flakeRateInterval = null

# acceptable ranges for values
flakeSizeRange = [-2, 20]
flakeRateRange = [5, 500]

# current values
currentFlakeSize = null
currentFlakeRate = null

# --------------------------------------------------

createFlake = (size=0)->
  position = [-10, randRange 0, canvas.scrollWidth]
  timing = randRange 50, 200
  size = randRange 3+size, 8+size

  flake = new Snowflake position, timing, size

  canvas.appendChild flake.element
  flake.animate()

  flake.onDestruct = () ->
    canvas.removeChild flake.element

startFlakeRateInterval = ->
  clearInterval flakeRateInterval if flakeRateInterval isnt null
  flakeRateInterval = setInterval () ->
    createFlake currentFlakeSize
  , currentFlakeRate

calculatePercentageForRange = (range, percent) ->
  Math.round(Math.abs(percent * (range[0] - range[1]))) + range[0]

setCurrentFlakeSize = () ->
  percent = parseInt(sizeInput.value, 10) / 100
  currentFlakeSize = calculatePercentageForRange flakeSizeRange, percent

setCurrentFlakeRate = () ->
  percent = parseInt(rateInput.value, 10) / 100
  currentFlakeRate = calculatePercentageForRange flakeRateRange, percent

sizeInputChangeHandler = () ->
  setCurrentFlakeSize()
  startFlakeRateInterval()

rateInputChangeHandler = () ->
  setCurrentFlakeRate()
  startFlakeRateInterval()

attachEvents = ->
  sizeInput.addEventListener "change", sizeInputChangeHandler
  rateInput.addEventListener "change", rateInputChangeHandler


# --------------------------------------------------

window.addEventListener "DOMContentLoaded", () ->
  canvas = document.getElementById "canvas"
  sizeInput = document.getElementById "size-input"
  rateInput = document.getElementById "rate-input"
  setCurrentFlakeSize()
  setCurrentFlakeRate()
  attachEvents()
  startFlakeRateInterval()


