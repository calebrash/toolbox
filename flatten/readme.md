# Flatten.js

Flatten.js converts a nested, JSON-style object to a flat object.

Consider this object:

```javascript
var obj = {
    x: 10,
    y: 11,
    z: {
        a: 5,
        b: 6,
        c: {
            x: 100,
            y: 101,
            z: 102
        }
    }
};
```

Flatten it:

```javascript
var flattenedObj = flatten(obj);
flattenedObj.z__c__x; // => 100
```

Also, you can opt to attach it to specific context:

```javascript
flatten(obj, this);
z__c__y; // => 101
```

