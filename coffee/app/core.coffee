'use strict'

define [
  'select2/src/js/jquery.select2'
  'select2/src/js/select2/i18n/pt-BR'
], (Select2, Utils) ->

  $.fn.select2.defaults
    .defaults.amdBase = 'select2/src/js/select2/'
  $.fn.select2.defaults
    .defaults.amdLanguageBase = 'select2/src/js/select2/i18n/'

  # Ajax
  $comboAjax = $ '#comboAjax'
  $comboAjax.select2
    language: 'pt-BR'
    width: '100%'
    ajax:
      url: 'https://api.github.com/search/repositories'
      dataType: 'json'
      delay: 250
      data: (params) ->
        q: params.term
        page: params.page
      processResults: (data, params) ->
        params.page = params.page || 1
        results: data.items
        pagination:
          more: (params.page * 30) < data.total_count
      cache: true
    minimumInputLength: 1
    escapeMarkup: (content) ->
      content
    templateResult: (repo) ->
      console.log repo
      if repo.loading
        return repo.text
      """
      <div><b>#{repo.full_name}</b> <i>#{repo.stargazers_count}</i></div>
      """
    templateSelection: (repo) ->
      repo.full_name || repo.text

  $comboAjax.on 'select2:select', (event) ->
    console.log 'select2:select', event
    return

  return
