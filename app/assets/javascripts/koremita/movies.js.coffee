# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
http = require 'http'
http.get { host:  "http://koremita.herokuapp.com/" },  (res)  -> console.log res.statusCode

