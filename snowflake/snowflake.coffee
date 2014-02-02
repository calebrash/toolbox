randRange = (a, b) ->
  ~~(Math.random() * (b - a + 1)) + a

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
  setSpeed: () ->
    @speed[0] = randRange -1, 4
    @speed[1] = randRange -2, 2
  setPosition: () ->
    if @position[0] > 400 then @destruct()
    if @destructed then return
    @position[0] = @position[0] + @speed[0]
    @position[1] = @position[1] + @speed[1]
    @element.style.top = "#{@position[0]}px"
    @element.style.left = "#{@position[1]}px"
  animate: () ->
    @interval = setInterval =>
      @setSpeed()
      @setPosition()
    , @timing
  onDestruct: () -> # user defined
  destruct: () ->
    @destructed = yes
    clearInterval @interval
    @onDestruct()

window.randRange = randRange
window.Snowflake = Snowflake