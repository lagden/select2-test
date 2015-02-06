'use strict'

define [
  'select2/src/js/jquery.select2'
  'select2/src/js/select2/i18n/pt-BR'
  'helpers/highlight'
], (Select2, Utils, highlight) ->

  $.fn.select2.defaults
    .defaults.amdBase = 'select2/src/js/select2/'
  $.fn.select2.defaults
    .defaults.amdLanguageBase = 'select2/src/js/select2/i18n/'

  field = 'full_name'
  idField = 'id'
  urlAjax = 'https://api.github.com/search/repositories'

  # Ajax
  $comboAjax = $ '#comboAjax'
  $comboAjax.select2
    language: 'pt-BR'
    width: '100%'
    ajax:
      url: urlAjax
      dataType: 'json'
      delay: 250
      data: (params) ->
        q: params.term
        page: params.page
      processResults: (res, params) ->
        params.page = params.page || 1
        items = []
        if res.hasOwnProperty 'items'
          if res.items
            items = res.items.map (o) ->
              o.highlight = highlight o[field], params.term
              o.id = o[idField]
              o.text = o[field]
              o
        results: items
        pagination:
          more: (params.page * 30) < res.total_count
      cache: true
    minimumInputLength: 1
    escapeMarkup: (content) ->
      content
    templateResult: (item) ->
      if item.loading
        return item.text
      item.highlight

  $comboAjax.on 'select2:select', (event) ->
    console.log 'select2:select', event
    return

  return
