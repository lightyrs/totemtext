#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.Totem =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  initialize: ->
    new Totem.Routers.App
    Backbone.history.start(pushState: true)

jQuery(document).ready ->
  Totem.initialize()