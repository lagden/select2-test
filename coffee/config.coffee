'use strict'

define 'config', ->
  requirejs.config
    baseUrl: '/js/lib'
    paths:
      app: '../app'
      helpers: '../helpers'
      templates: '../templates'

  return
