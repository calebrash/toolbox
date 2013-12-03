
# convert hex color to rgb values (0-255)
toRgb = (hexColor) ->
    hexColor = hexColor.replace "#", ""

    # ex: 0f0
    if hexColor.length is 3
        hexColor = hexColor.split ""
        hexColor = (color+color for color in hexColor)

    # ex: 00ff00
    else
        hexColor = hexColor.match /.{2}/g

    return {
        r: parseInt hexColor[0], 16
        g: parseInt hexColor[1], 16
        b: parseInt hexColor[2], 16
    }

# convert rgb values to hex color
toHex = (rgbColor) ->
    r = rgbColor.r.toString 16
    g = rgbColor.g.toString 16
    b = rgbColor.b.toString 16

    # prepend 0 if only one digit
    if r.length is 1 then r = "0#{r}"
    if g.length is 1 then g = "0#{g}"
    if b.length is 1 then b = "0#{b}"
    "##{r}#{g}#{b}"

# calculate the value of amount of x from a to b  
diff = (a, b, amount) ->
  # (amount * (a - b)) + a
  if a > b
    x = a
    a = b
    b = x
    amount = 1 - amount
  Math.round(Math.abs(amount * (a - b))) + a

# mix color1 and color2 by amount
# 0 -> color1; 1 -> color2; 0.5 -> 50/50 color1 and color2
mix = (color1, color2, amount=0.5) ->
    color1 = toRgb color1
    color2 = toRgb color2
    color3 =
         r: diff color1.r, color2.r, amount
         g: diff color1.g, color2.g, amount
         b: diff color1.b, color2.b, amount
    toHex color3

