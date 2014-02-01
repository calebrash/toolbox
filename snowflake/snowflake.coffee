# get random int between a and b
randRange = (a, b) ->
  ~~(Math.random() * (b - a + 1)) + a


# Snowflake:
# (array) position: initial x,y coordinates for 
#     snowflake
# (int) timing: rate at which snowflake will fall, 
#     used for setInterval
# (int) size: size of the snowflake in pixels

class Snowflake
  constructor: (position, timing, size) ->
    @speed = [0, 0]
    @position = position
    @timing = timing
    size = size
    @element = document.createElement "div"
    @element.setAttribute "class", "flake"
    @element.style.width = "#{size}px"
    @element.style.height = "#{size}px"
    @setSpeed()
    @setPosition()
    @destructed = no

  # randomly adjust the snowflake's speed
  setSpeed: () ->
    @speed[0] = randRange -1, 4
    @speed[1] = randRange -2, 2

  # calculate snowflake position accounting for 
  # edges
  setPosition: () ->
    if @position[0] > 400 then @destruct()
    if @destructed then return
    @position[0] = @position[0] + @speed[0]
    @position[1] = @position[1] + @speed[1]
    @element.style.top = "#{@position[0]}px"
    @element.style.left = "#{@position[1]}px"

  # set the interval
  animate: () ->
    @interval = setInterval =>
      @setSpeed()
      @setPosition()
    , @timing

  # handle snowflake destruction, user defined, 
  # ideally used to remove the snowflake element 
  # from the DOM
  onDestruct: () ->

  # destroy the snowflake
  destruct: () ->
    @destructed = yes
    clearInterval @interval
    @onDestruct()
