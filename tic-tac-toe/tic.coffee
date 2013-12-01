tilestatus =
  empty: 10
  x:   11
  o:   12
  reverse: (status) ->
    switch status
      when @empty then ""
      when @x     then "X"
      when @o     then "O"

gamestatus =
  active: 20
  won:
    x:  21
    o:  22
  draw: 23
  reverse: (status) ->
    switch status
      when @active then "active"
      when @won.x  then "done x-won"
      when @won.o  then "done o-won"
      when @draw   then "done draw"



class Tile
  constructor: () ->
    @status = tilestatus.empty
  textStatus: () ->
    tilestatus.reverse @status


class TicTacToe
  constructor: () ->
    @status = gamestatus.active
    for i in [0..2]
      @board[i] = []
      for j in [0..2]
        @board[i][j] = new Tile()
  board: []
  turn: tilestatus.x
  textStatus: () ->
    gamestatus.reverse @status
  isDone: () ->
    return @status is gamestatus.won.x or @status is gamestatus.won.o or @status is gamestatus.draw
  isMatch: (t1, t2, t3) ->
    return t1.status isnt tilestatus.empty and t1.status is t2.status is t3.status
  setWin: (status) ->
    if status is tilestatus.x
      @status = gamestatus.won.x
    else
      @status = gamestatus.won.o
  checkForWin: (x, y) ->
    # check draw
    if @movesTaken is 9 then @status = gamestatus.draw

    # check rows
    else if @isMatch @board[0][0], @board[1][0], @board[2][0]
      @setWin @board[0][0].status
    else if @isMatch @board[0][1], @board[1][1], @board[2][1]
      @setWin @board[0][1].status
    else if @isMatch @board[0][2], @board[1][2], @board[2][2]
      @setWin @board[0][2].status

    # check cols
    else if @isMatch @board[0][0], @board[0][1], @board[0][2]
      @setWin @board[0][0].status
    else if @isMatch @board[1][0], @board[1][1], @board[1][2]
      @setWin @board[1][0].status
    else if @isMatch @board[2][0], @board[2][1], @board[2][2]
      @setWin @board[2][0].status

    # check diags
    else if @isMatch @board[0][0], @board[1][1], @board[2][2]
      @setWin @board[0][0].status
    else if @isMatch @board[2][0], @board[1][1], @board[0][2]
      @setWin @board[2][0].status

  movesTaken: 0
  setMove: (x, y) ->
    return if @board[x][y].status isnt tilestatus.empty
    return if @isDone()
    @movesTaken = @movesTaken + 1
    @board[x][y].status = @turn
    if @turn is tilestatus.x
      @turn = tilestatus.o
    else
      @turn = tilestatus.x
    @checkForWin x, y
    @status


window.TicTacToe = TicTacToe
window.gamestatus = gamestatus

