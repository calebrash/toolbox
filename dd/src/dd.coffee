# --------------------------------------------------
#   $$ // Double Dollar
#   Simple jQuery optimization library
#   https://github.com/calebrash/dd.js
# --------------------------------------------------

do (window, jQuery) ->

    # test for jQuery
    if typeof jQuery is undefined
        throw new ReferenceError "$$ requires $"

    $ = jQuery # single dollar


    if typeof document.querySelector isnt undefined

        # if document.querySelector exists, we can do a bunch
        # of great optimizations using native functions
        all  = (q) -> $ document.querySelectorAll q
        one  = (q) -> $ document.querySelector q
        tag  = (q) -> $ document.getElementsByTagName q
        name = (q) -> $ document.getElementsByName q
        className = (q) -> $ document.getElementsByClassName q

    else

        # if document.querySelector doesn't exist, we can
        # fall back to plain old jQuery
        all  = (q) -> $ q
        one  = (q) -> $ $(q)[0]
        tag  = (q) -> $ q
        name = (q) -> $ "[name=#{q}]"
        className = (q) -> $ ".#{q}"


    # create $$
    # add all of the amazing optimizations from above
    # plus a couple of even greater optimizations
    $$ =
        doc:       $ document
        body:      $ document.body
        window:    $ window
        id:        (id) -> $ document.getElementById id
        all:       all
        one:       one
        tag:       tag
        name:      name
        className: className


    # export
    window.$$ = $$

