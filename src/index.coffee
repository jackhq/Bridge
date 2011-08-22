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
    
  create: (data, cb) ->
    $.post("/#{@resource}", data, null, "json")
      .success( (data, txtStatus) -> 
        if data["errors"] then cb(data["errors"], data) else cb(null, data)
      )
      .error( (data, txtStatus) -> 
        cb({ message: "Server returned and error status #{txtStatus}"}, data)
      )
    true
  
  update: (id, data, cb) ->
    data['_method'] = 'put'
    $.post("/#{@resource}/#{id}", data, null, "json")
      .success( (data, txtStatus) -> 
        if data["errors"] then cb(data["errors"], data) else cb(null, data)
      )
      .error( (data, txtStatus) -> 
        cb({ message: "Server returned and error status #{txtStatus}"}, data)
      )
    true

  delete: (id, cb) -> 
    data = { '_method': 'delete' }
    $.post("/#{@resource}/#{id}", data, null, "json")
      .success( (data, txtStatus) -> 
        if data["errors"] then cb(data["errors"], data) else cb(null, data)
      )
      .error( (data, txtStatus) -> 
        cb({ message: "Server returned and error status #{txtStatus}"}, data)
      )
    true
    
  search: (criteria) ->
    console.log 'Criteria'
    
  valid: ->
    if @resource then true else false

if window then exports = window

exports.Bridge = Bridge

