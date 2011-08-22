# Bridge a connection from SproutCore to Rails
#$ = require 'jquery'

class Bridge
  constructor: (@resource)->

  # callback returns (err, data)
  all: (cb) ->
    $.getJSON("/#{@resource}")
      .success( (data, txtStatus) -> 
        if data["errors"] then cb(data["errors"], data) else cb(null, data)
      )
      .error( (data, txtStatus) -> 
        cb({ message: "Server returned and error status #{txtStatus}"}, data)
      )
    true
    
  get: (id, cb) -> 
    $.getJSON("/#{@resource}/#{id}")
      .success( (data, txtStatus) -> 
        if data["errors"] then cb(data["errors"], data) else cb(null, data)
      )
      .error( (data, txtStatus) -> 
        cb({ message: "Server returned and error status #{txtStatus}"}, data)
      )
    true
    
  create: (data) ->
    console.log 'Create one resource'
  update: (data) ->
    console.log 'Update one resource'
  delete: (id) -> 
    console.log 'Delete one resource'
  search: (criteria) ->
    console.log 'Criteria'
    
  valid: ->
    if @resource then true else false

if window then exports = window

exports.Bridge = Bridge

