container = null
game = null

render = () ->
  html = ""
  for row, x in game.board
    for tile, y in row
      html = "#{html}<a href=\"#\" data-x=\"#{x}\" data-y=\"#{y}\" class=\"tile-#{tile.textStatus()}\">"
      html = "#{html}<span class=\"x\">X</span><span class=\"o\">O</span></a>"
  html = "#{html}<div id=\"msg\" class=\"msg\"></div>"
  container.innerHTML = html
  game.textStatus().split(' ').forEach (c) ->
    container.classList.add c
  if game.textStatus().indexOf("done") >= 0
    msg = document.getElementById "msg"
    switch game.status
      when gamestatus.won.x then msgtext = "X is the winner!"
      when gamestatus.won.o then msgtext = "O is the winner!"
      when gamestatus.draw  then msgtext = "It's a draw."
    msg.innerHTML = msgtext
    setTimeout () ->
      game = new TicTacToe()
      container.setAttribute "class", ""
      msg.innerHTML = ""
      render()
    , 3000
  else
    events()

events = () ->
  for node in container.childNodes
    node.addEventListener "click", (e) ->
      e.preventDefault()
      data = @dataset
      game.setMove data.x, data.y
      render()

window.addEventListener "DOMContentLoaded", ->
  container = document.getElementById "game"
  game = new TicTacToe()
  render()
