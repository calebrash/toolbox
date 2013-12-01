do () ->
  since_deltas =
    30:   () -> "just now"
    60:   () -> "less than a minute ago"
    120:  () -> "a minute ago"
    600:  () -> "a few minutes ago"
    960:  () -> "about 10 minutes ago"
    1500: () -> "about 20 minutes ago"
    
  
  until_delta =
    30:   () -> "in a few seconds"
    60:   () -> "in less than a minute"
    120:  () -> "in a minute"
    600:  () -> "in a few minutes"
    960:  () -> "in about 10 minutes"
    1500: () -> "in about 20 minutes"

  now = () ->
    new Date()

  naturaltimesince = (time, compare=now()) ->
    compare_delta = (time - compare.getTime()) / -1000
    for delta of since_deltas
      return since_deltas[delta]() if compare_delta < delta

  naturaltimeuntil = (time, compare=now()) ->
    compare_delta = (time - compare.getTime()) / 1000
    for delta of since_deltas
      return since_deltas[delta]() if compare_delta < delta

  naturaltime = (compare=now()) ->
    time = @getTime()
    if (compare.getTime() - time) > 1 then return naturaltimesince time, compare
    else return naturaltimeuntil time, compare

  Date.prototype.natural = naturaltime
