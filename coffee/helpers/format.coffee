'use strict'

define ->

  highlight = (source, term) ->
    matchStart = source.toLowerCase().indexOf('' + term.toLowerCase() + '')
    matchEnd = matchStart + term.length - 1
    beforeMatch = source.slice(0, matchStart)
    matchText = source.slice(matchStart, matchEnd + 1)
    afterMatch = source.slice(matchEnd + 1)
    """
    #{beforeMatch}<b>#{matchText}</b>#{afterMatch}
    """

  format  = (source, term) ->
    regex = new RegExp "(#{term})", 'ig'
    source.replace regex, "<b>$1</b>"

  format
