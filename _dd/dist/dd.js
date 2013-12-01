(function(window, jQuery) {
  var $, $$, all, className, name, one, tag;
  if (typeof jQuery === void 0) {
    throw new ReferenceError("$$ requires $");
  }
  $ = jQuery;
  if (typeof document.querySelector !== void 0) {
    all = function(q) {
      return $(document.querySelectorAll(q));
    };
    one = function(q) {
      return $(document.querySelector(q));
    };
    tag = function(q) {
      return $(document.getElementsByTagName(q));
    };
    name = function(q) {
      return $(document.getElementsByName(q));
    };
    className = function(q) {
      return $(document.getElementsByClassName(q));
    };
  } else {
    all = function(q) {
      return $(q);
    };
    one = function(q) {
      return $($(q)[0]);
    };
    tag = function(q) {
      return $(q);
    };
    name = function(q) {
      return $("[name=" + q + "]");
    };
    className = function(q) {
      return $("." + q);
    };
  }
  $$ = {
    doc: $(document),
    body: $(document.body),
    window: $(window),
    id: function(id) {
      return $(document.getElementById(id));
    },
    all: all,
    one: one,
    tag: tag,
    name: name,
    className: className
  };
  return window.$$ = $$;
})(window, jQuery);
