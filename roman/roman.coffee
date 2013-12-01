do () ->
  m =
    M: 1000, CM: 900, D: 500, CD: 400, C: 100, XC: 90, 
    L:   50, XL:  40, X:  10, IX:   9, V:   5, IV:  4, I: 1

  toRoman = (n) ->
    result = []
    return 'N' if n is 0
    for num of m
      while n >= m[num]
        n -= m[num]
        result.push num
    result.join ''

  fromRoman = (s) ->
    result = 0
    return 0 if s is "N"
    s = s.split ''
    for i in [0..s.length-1]
      if m[s[i]+s[i+1]]
        result += m[s[i]+s[i+1]]
        _i += 1 # internal i -- BAD! Fix this!
      else if m[s[i]]
        result += m[s[i]]
      else
        result = NaN
        break
    result

  Number.prototype.toRoman    = () -> toRoman @
  String.prototype.toRoman    = () -> toRoman parseInt @, 10
  String.prototype.parseRoman = () -> fromRoman @
