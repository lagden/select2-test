'use strict'

define ->

  highlight  = (source, term) ->
    words = term.split ' '
    for word in words
      if word and source
        # regex = new RegExp "\\b(#{word})\\b", 'ig'
        regex = new RegExp "(#{word})", 'ig'
        source = source.replace regex, "<b>$1</b>"
    source
