# Runner

Runner is a simplified CoffeeScript rewrite of [Turnstile](https://github.com/calebrash/turnstile).

```javascript
// this creates a new runner that fires
// once every second (1000ms) with a max
// of 100 empty runs (after 100 runs 
// without a callback, the interval is 
// reset)
runner = new Runner(1000, 100);
```
```javascript
runner = new Runner(500)
runner.push(function () { console.log(1); });
runner.push(function () { console.log(2); });
runner.push(function () { console.log(3); });
runner.push(function () { console.log(4); });
runner.push(function () { console.log(5); });
// logs one number per 0.5 second
```
