# (Half-baked) natural time function


## Usage
### Compare a date object to "now"
```javascript
var now = new Date();
console.log(now.natural()); // => "just now"
```

### Compare two date objects
```javascript
var a = new Date(),
    b = new Date(a.getTime() + 50000) // 50s from now
console.log(a.natural(b)); // => "less than a minute ago"
```


## List of deltas
### Since
- 30s: just now"
- 60s: less than a minute ago
- 120s: a minute ago
- 600s: a few minutes ago
- 960s: about 10 minutes ago
- 1500s: about 20 minutes ago

### Until
30: in a few seconds
60: in less than a minute
120: in a minute
600: in a few minutes
960: in about 10 minutes
1500: in about 20 minutes
