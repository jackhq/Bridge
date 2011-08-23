# # The Bridge
# Bridge a connection from SproutCore to Rails
#$ = require 'jquery'

# ## Usage example:
# 
# posts = new Bridge('posts')
# Now you have a resourceful adapter to your server.
class Bridge
  # constructor automatically set the resource attribute
  constructor: (@resource)->

  # All executes GET /[your resource]    
  # Usage ex:     
  #     bridge.all(function(err, data) {    
  #       // Respond to the results here    
  #       // if err is not null - then the server    
  #       // return an error or errors object    
  #     });    
  all: (cb) ->
    $.getJSON("/#{@resource}")
      .success( (data, txtStatus) -> 
        if data["errors"] then cb(data["errors"], data) else cb(null, data)
      )
      .error( (data, txtStatus) -> 
        cb({ message: "Server returned and error status #{txtStatus}"}, data)
      )
    true

  # Get executes GET /[your resource]/[id]     
  # Usage ex:      
  #     bridge.get([id], function(err, data) {    
  #       // Respond to the results here     
  #       // if err is not null - then the server     
  #       // return an error or errors object     
  #     });     
  get: (id, cb) -> 
    $.getJSON("/#{@resource}/#{id}")
      .success( (data, txtStatus) -> 
        if data["errors"] then cb(data["errors"], data) else cb(null, data)
      )
      .error( (data, txtStatus) -> 
        cb({ message: "Server returned and error status #{txtStatus}"}, data)
      )
    true

  # create executes POST /[your resource]    
  # Usage ex:     
  #     bridge.create([data], function(err, data) {     
  #       // Respond to the results here     
  #       // if err is not null - then the server    
  #       // return an error or errors object      
  #     });      
  create: (data, cb) ->
    $.post("/#{@resource}", data, null, "json")
      .success( (data, txtStatus) -> 
        if data["errors"] then cb(data["errors"], data) else cb(null, data)
      )
      .error( (data, txtStatus) -> 
        cb({ message: "Server returned and error status #{txtStatus}"}, data)
      )
    true

  # update executes PUT /[your resource]/[id]     
  # Usage ex:     
  #     bridge.update([id], [data], function(err, data) {     
  #       // Respond to the results here      
  #       // if err is not null - then the server      
  #       // return an error or errors object      
  #     });     
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

  # delete executes DELETE /[your resource]/[id]      
  # Usage ex:     
  #     bridge.update([id], function(err, data) {     
  #       // Respond to the results here              
  #       // if err is not null - then the server     
  #       // return an error or errors object         
  #     });     
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

  # find executes GET /[your resource]?[params]         
  #     bridge.update([params], function(err, data) {   
  #       // Respond to the results here                
  #       // if err is not null - then the server       
  #       // return an error or errors object           
  #     });                                             
  find: (criteria) ->
    console.log 'Comming Soon'
    
  # valid executes checks if the resource is set.       
  # Usage ex:                                           
  #     bridge.valid() == true or false;                
  valid: ->
    if @resource then true else false

if window then exports = window
exports.Bridge = Bridge

