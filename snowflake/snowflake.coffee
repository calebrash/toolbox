class Snowflake
  constructor: () ->
    @speed = [0, 0]
    @position = [-10, randRange 0, 800]
    @timing = randRange 50, 200
    size = randRange 3, 8
    @element = document.createElement "div"
    @element.setAttribute "class", "flake"
    @element.style.width = "#{size}px"
    @element.style.height = "#{size}px"
    @setSpeed()
    @setPosition()
    @destructed = no
  setSpeed: () ->
    @speed[0] = randRange -1, 4
    @speed[1] = randRange -2, 3
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
