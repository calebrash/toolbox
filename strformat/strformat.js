var strformat = (function () {

    // parsers for each type of interpolation
    var parsers = {
        '%f': function (str) { return parseFloat(str).toFixed(2); },
        '%d': function (str) { return parseInt(str, 10); },
        '%s': function (str) { return str; }
    }

    // regex for extracting values
    var regex = /(\%[fds])/g;
    
    return function (str) {

        // the first argument is the string
        var args = Array.prototype.slice.call(arguments, 1, 100),
            matches = str.match(regex),
            result;

        matches.forEach(function (m, index) {
            // try to invoke a parser
            try {
                result = parsers[m](args[index].valueOf());

            // or just add it raw
            } catch (e) {
                result = args[index];
            }
            str = str.replace(m, result);
        });
        return str;
    };
})();
