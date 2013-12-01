# dd.js



_$$_ (double-dollar or _dd_) is a very simple jQuery optimization library. _$$_ uses native 
JavaScript where possible to greatly improve element selection speed.

_$$ v0.0.2_



## Why and how?

[Over half of all websites use jQuery (and that's old data)](http://royal.pingdom.com/2012/06/20/jquery-numbers/). 
It offers a ton of benefits and makes dealing with the DOM a pleasant experience. However, that 
convenience comes at the price of speed. There are a number of ways to optimize jQuery, but 
nothing comes close to native JavaScript functions. _$$_ attempts to provide a way to harness the 
speed of native JavaScript while still retaining the benefits of jQuery.

Oh, and _$$_ is definitely fast. Below is a speed test comparing jQuery to _$$_ for selecting five 
elements on a page by id. On average, _$$_ is 2-4 times faster than jQuery. (Want to contribute? 
Make more speed tests!)

- [http://jsperf.com/dd-js-id](http://jsperf.com/dd-js-id).




## Usage

Use _$$_ to replace slower jQuery selections.

Example:

```javascript
// jQuery
$('#mydiv').addClass('test');
$('.mydivs').addClass('test');

// $$
$$.id('mydiv').addClass('test');
$$.all('.mydivs').addClass('test');
```



## Install with Bower

```bash
bower install dd

# Available at:
# bower_components/dd/dist/dd.js
# bower_components/dd/dist/dd.min.js
```



## Available Methods

### $$.id
Select an element by its id.
```html
<div id="mydiv"></div>
```
```javascript
$$.id('mydiv');
```

### $$.doc
Shortcut for `$(document)`.
```javascript
$$.doc.ready(function () {
    // ...
});
```

### $$.body
Shortcut for `$(body)`.
```javascript
$$.body.addClass('test');
```

### $$.window
Shortcut for `$(window)`.
```javascript
$$.window.innerWidth();
```

### $$.all
Select all elements that match a query.
```html
<div class="test"></div>
<div class="test"></div>
<div></div>
```
```javascript
$$.all('.test').length; // => 2
```

### $$.one
Select the first element that matches a query.
```html
<div></div>
<div></div>
<div></div>
```
```javascript
$$.one('div').length; // => 1
```

### $$.tag
Select all elements of the same tag.
```html
<div></div>
<div></div>
<div></div>
```
```javascript
$$.tag('div').length; // => 3
```

### $$.name
Select all elements with the same name attribute.
```html
<input name="test" value="hello">
```
```javascript
$$.name('test').val(); // => "hello"
```

### $$.className
Select all elements that have a particular class.
```html
<div class="test"></div>
<div class="test"></div>
<div></div>
```
```javascript
$$.className('test').length; // => 2
```



