(function() {
  describe('Bridge', function() {
    var bridge;
    bridge = null;
    beforeEach(function() {
      return bridge = new Bridge;
    });
    it('should create resource as constructor', function() {
      var my_bridge;
      my_bridge = new Bridge('bar');
      return expect(my_bridge.resource).toEqual('bar');
    });
    it('should require resource', function() {
      bridge.resource = 'foo';
      return expect(bridge.resource).toEqual('foo');
    });
    it('validate for bridge resource should be required', function() {
      return expect(bridge.valid()).toEqual(false);
    });
    it('validate for bridge resource should be required', function() {
      bridge.resource = 'foo';
      return expect(bridge.valid()).toEqual(true);
    });
    it('all method should successfully return an array of json via callback', function() {
      bridge.resource = 'foo';
      runs(function() {
        return bridge.all(function(err, data) {
          return expect(data.hello).toEqual('world');
        });
      });
      return waits(100);
    });
    it('all method should return an error if no one home', function() {
      bridge.resource = 'error';
      runs(function() {
        return bridge.all(function(err, data) {
          return expect(err).toNotEqual(null);
        });
      });
      return waits(100);
    });
    it('all method should return an errors object if error occured on server', function() {
      bridge.resource = 'txfailure';
      runs(function() {
        return bridge.all(function(err, data) {
          return expect(err).toNotEqual(null);
        });
      });
      return waits(100);
    });
    it('get method should successfully return an array of json via callback', function() {
      bridge.resource = 'foo';
      runs(function() {
        return bridge.get(1, function(err, data) {
          return expect(data.hello).toEqual('world');
        });
      });
      return waits(100);
    });
    it('get method should return an error if no one home', function() {
      bridge.resource = 'error';
      runs(function() {
        return bridge.get(1, function(err, data) {
          return expect(err).toNotEqual(null);
        });
      });
      return waits(100);
    });
    return it('get method should return an errors object if error occured on server', function() {
      bridge.resource = 'txfailure';
      runs(function() {
        return bridge.get(1, function(err, data) {
          return expect(err).toNotEqual(null);
        });
      });
      return waits(100);
    });
  });
}).call(this);
