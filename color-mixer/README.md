# Color Mixer

A function for mixing two colors by a percentage amount.

```javascript
mix("#000", "#fff"); // => #808080, amount defaults to 0.5
mix("#000", "#fff", 0.25); // => #404040, 0.25 leans toward #000
mix("#000", "#fff", 0.75); // => #bfbfbf, 0.75 leans toward #fff
mix("#123456", "#abcdef"); // => #5f81a3 
```

[Live example](http://calebrash.github.io/toolbox/color-mixer/)
