class Totem.Routers.App extends Backbone.Router

  routes:
    '': 'index'

  index: ->
    new Totem.Views.RedactorView()