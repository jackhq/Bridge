(function() {
  var Bridge, exports;
  Bridge = (function() {
    function Bridge(resource) {
      this.resource = resource;
    }
    Bridge.prototype.all = function(cb) {
      $.getJSON("/" + this.resource).success(function(data, txtStatus) {
        if (data["errors"]) {
          return cb(data["errors"], data);
        } else {
          return cb(null, data);
        }
      }).error(function(data, txtStatus) {
        return cb({
          message: "Server returned and error status " + txtStatus
        }, data);
      });
      return true;
    };
    Bridge.prototype.get = function(id, cb) {
      $.getJSON("/" + this.resource + "/" + id).success(function(data, txtStatus) {
        if (data["errors"]) {
          return cb(data["errors"], data);
        } else {
          return cb(null, data);
        }
      }).error(function(data, txtStatus) {
        return cb({
          message: "Server returned and error status " + txtStatus
        }, data);
      });
      return true;
    };
    Bridge.prototype.create = function(data, cb) {
      $.post("/" + this.resource, data, null, "json").success(function(data, txtStatus) {
        if (data["errors"]) {
          return cb(data["errors"], data);
        } else {
          return cb(null, data);
        }
      }).error(function(data, txtStatus) {
        return cb({
          message: "Server returned and error status " + txtStatus
        }, data);
      });
      return true;
    };
    Bridge.prototype.update = function(id, data, cb) {
      data['_method'] = 'put';
      $.post("/" + this.resource + "/" + id, data, null, "json").success(function(data, txtStatus) {
        if (data["errors"]) {
          return cb(data["errors"], data);
        } else {
          return cb(null, data);
        }
      }).error(function(data, txtStatus) {
        return cb({
          message: "Server returned and error status " + txtStatus
        }, data);
      });
      return true;
    };
    Bridge.prototype["delete"] = function(id, cb) {
      var data;
      data = {
        '_method': 'delete'
      };
      $.post("/" + this.resource + "/" + id, data, null, "json").success(function(data, txtStatus) {
        if (data["errors"]) {
          return cb(data["errors"], data);
        } else {
          return cb(null, data);
        }
      }).error(function(data, txtStatus) {
        return cb({
          message: "Server returned and error status " + txtStatus
        }, data);
      });
      return true;
    };
    Bridge.prototype.find = function(criteria) {
      return console.log('Comming Soon');
    };
    Bridge.prototype.valid = function() {
      if (this.resource) {
        return true;
      } else {
        return false;
      }
    };
    return Bridge;
  })();
  if (window) {
    exports = window;
  }
  exports.Bridge = Bridge;
}).call(this);
