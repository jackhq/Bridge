# (Bridge) Resourceful Data Bridge!

This is a simple javascript library that allows you to connect to
your resourceful server objects.  It does not do anything fancy like
jsonp or any complex commands, it simply acts as a nice wrapper around the jquery ajax api.  This wrapper makes it easy to connect your sprout core client controllers and models to the server side controller and models.  It does not do any caching or anything strange with the data it just passes the data your send in common methods that may be more familiar to you than the resourceful verbs.

## Install

You can download bridge-0.1.0.js from the dist directory, it is not minified or compressed.

## Usage

Include in your web application after jquery.

    posts = new Bridge('posts');
    
    posts.all(function(err, data) {
      // Get All Posts
    });

    posts.create(data, function(err, data) {
      // Create Post
    });
    
    
See the docs/index.html for annotated source

## Testing

1. Ruby must be installed
2. Install bundler

    gem install bundler

3. Use Bundler to install Sinatra test web server

    bundle install

4. Install nodejs and npm

    see nodejs.org and npmjs.org

5. Install node dependencies

    npm install
    
6. Run Test Server (in one console)

    ruby app.rb

7. Run Test Browser

    open SpecRunner.html

* Successfully tested with jQuery 1.6.1

## Support

Please create an issue or hit us up on twitter @jackhq

## Contributions

All contributions are welcome, but the purpose of this library is to be
lean and mean, not full of features there are a lot of great libs for all of that.

## Thank You Authors and Contributors to:

* Coffee-Script
* NodeJs
* jQuery
* Rails
* Jasmine
* Docco
