do (window) ->
  defaultRate  = 10
  defaultLimit = 10

  class Runner
    constructor: (@rate=defaultRate, @limit=defaultLimit) ->
    rate:   null
    limit:  null
    queue:  []
    poll:   null
    missed: 0
    push: (callback) ->
      @queue.push callback
      @start() if @poll is null
    start: () ->
      @poll = setInterval @runner, @rate
    runner: () =>
      l = @queue.length
      if l > 0
        callback = @queue.shift()
        callback()
      else if @missed >= @limit
        @missed = 0
        clearInterval @poll
      else
        @missed += 1

  window.Runner = Runner
