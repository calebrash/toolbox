var flatten = (function () {

    // adapted from underscore.extend
    var extend = function (obj) {
        if(typeof obj !== 'object') {
            return obj;
        }

        var orig,
            key,
            i = 1,
            l = arguments.length;

        for (i; i < l; i++) {
            orig = arguments[i];
            for (key in orig) {
                obj[key] = orig[key];
            }
        }

        return obj;
    };

    // flatten the object
    var flatten = function (obj, prefix) {

        // used to prepend the previous key for recursion
        prefix = prefix || null;

        var result = {}, // flattened result object
            key,         // current object key
            new_key;     // prefixed key

        for (key in obj) {
            // create the new key
            new_key = prefix === null ? key : prefix + '__' + key;

            // if the current key is an object, flatten it
            if(typeof obj[key] === 'object') {
                result = extend({}, result, flatten(obj[key], new_key));

            // else add it to the result
            } else {
                result[new_key] = obj[key];
            }
        }

        return result;
    };

    // flatten the object and attach it to a context    
    var flattenAndAttach = function (obj, context) {

        // context is optional
        context = context || null;

        // flatten it
        obj = flatten(obj);

        // if no context, return the object
        if(context === null) {
            return obj;

        // attach the object to a context
        } else {
            var key;
            for(key in obj) {
                context[key] = obj[key];
            }
        }
    };
    
    // export
    return flattenAndAttach;
})();
