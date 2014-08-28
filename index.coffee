_ = require "underscore"
$ = require 'jquery'

debug = true

cname = ".d__panel"

####
#
# log = (require 'forelog')()
# log = (require 'forelog')(left: 0)
#
####

module.exports = (opt) ->

  cssobj = $.extend
    position: "fixed"
    top:0
    right:0
    background: "#fff"
    opacity: 0.8
    height: "100%"
    width: 300
    "word-break": "break-all"
    overflow: "scroll"
  , opt || {}

  (args...) ->

    return unless debug
    
    if $(cname).length < 1
      $("<div class='#{cname}'>").css cssobj
      .appendTo $( "body" )

    $("<pre style='color:blue'>").html( "==== LOG ==== " ).appendTo cname
    _.map args, (e, i) ->
      $("<pre>")
        .html JSON.stringify( e, null, 2 )+"<br>"
        .appendTo cname
