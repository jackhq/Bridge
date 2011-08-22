#require.paths.unshift '../lib'
#{ Bridge } = require('../lib')
describe 'Bridge', ->
  bridge = null
  beforeEach ->
    bridge = new Bridge
  it 'should create resource as constructor', ->
    my_bridge = new Bridge('bar')
    expect(my_bridge.resource).toEqual('bar')    
  it 'should require resource', ->
    bridge.resource = 'foo'
    expect(bridge.resource).toEqual('foo')
  it 'validate for bridge resource should be required', ->
    expect(bridge.valid()).toEqual(false)
  it 'validate for bridge resource should be required', ->
    bridge.resource = 'foo'
    expect(bridge.valid()).toEqual(true)
  
  it 'all method should successfully return an array of json via callback', ->
    bridge.resource = 'foo'
    runs( ->
      bridge.all( (err, data) ->
        expect(data.hello).toEqual('world')
      )
    )
    waits 100
   
  it 'all method should return an error if no one home', ->
    bridge.resource = 'error'
    runs( -> 
      bridge.all( (err, data) ->
        expect(err).toNotEqual(null)
      )
    )
    waits 100
  it 'all method should return an errors object if error occured on server', ->
    bridge.resource = 'txfailure'
    runs( -> 
      bridge.all( (err, data) ->
        expect(err).toNotEqual(null)
      )
    )
    waits 100


  it 'get method should successfully return an array of json via callback', ->
    bridge.resource = 'foo'
    runs( ->
      bridge.get(1, (err, data) ->
        expect(data.hello).toEqual('world')
      )
    )
    waits 100

  it 'get method should return an error if no one home', ->
    bridge.resource = 'error'
    runs( -> 
      bridge.get(1, (err, data) ->
        expect(err).toNotEqual(null)
      )
    )
    waits 100
  it 'get method should return an errors object if error occured on server', ->
    bridge.resource = 'txfailure'
    runs( -> 
      bridge.get(1, (err, data) ->
        expect(err).toNotEqual(null)
      )
    )
    waits 100


  it 'create method should successfully return an array of json via callback', ->
    bridge.resource = 'foo'
    runs( ->
      bridge.create({data: 'foo'}, (err, data) ->
        expect(data.hello).toEqual('world')
      )
    )
    waits 100

  it 'create method should return an error if no one home', ->
    bridge.resource = 'error'
    runs( -> 
      bridge.create({data: 'foo'}, (err, data) ->
        expect(err).toNotEqual(null)
      )
    )
    waits 100
  it 'create method should return an errors object if error occured on server', ->
    bridge.resource = 'txfailure'
    runs( -> 
      bridge.create({data: 'foo'}, (err, data) ->
        expect(err).toNotEqual(null)
      )
    )
    waits 100

  it 'update method should successfully return an array of json via callback', ->
    bridge.resource = 'foo'
    runs( ->
      bridge.update(1, {data: 'foo'}, (err, data) ->
        expect(data.hello).toEqual('world')
      )
    )
    waits 100

  it 'update method should return an error if no one home', ->
    bridge.resource = 'error'
    runs( -> 
      bridge.update(1, {data: 'foo'}, (err, data) ->
        expect(err).toNotEqual(null)
      )
    )
    waits 100
  it 'update method should return an errors object if error occured on server', ->
    bridge.resource = 'txfailure'
    runs( -> 
      bridge.update(1, {data: 'foo'}, (err, data) ->
        expect(err).toNotEqual(null)
      )
    )
    waits 100

  it 'delete method should successfully return an array of json via callback', ->
    bridge.resource = 'foo'
    runs( ->
      bridge.delete(1, (err, data) ->
        expect(data.hello).toEqual('world')
      )
    )
    waits 100

  it 'delete method should return an error if no one home', ->
    bridge.resource = 'error'
    runs( -> 
      bridge.delete(1, (err, data) ->
        expect(err).toNotEqual(null)
      )
    )
    waits 100
  it 'delete method should return an errors object if error occured on server', ->
    bridge.resource = 'txfailure'
    runs( -> 
      bridge.delete(1, (err, data) ->
        expect(err).toNotEqual(null)
      )
    )
    waits 100

