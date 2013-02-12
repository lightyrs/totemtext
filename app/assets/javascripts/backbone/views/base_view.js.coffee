# airbnb/backbone.baseview
# https://github.com/airbnb/backbone.baseview

class Totem.Views.BaseView extends Backbone.View

  template: null

  initialize: (options) ->
    @bindings()
    @_postInitialize()

  _postInitialize: ->
    @postInitialize()
    @trigger "initialize"

  getRenderData: ->
    if @model
      @model.toJSON()
    else
      {}

  getTemplate: ->
    JST[@template]  if @template and typeof JST isnt "undefined"

  getHtml: ->
    template = @getTemplate()
    if template
      template @getRenderData()
    else
      ""

  render: ->
    @$el.html @getHtml()
    @trigger "render"
    @postRender()
    this

  assign: (view, selector) ->
    view.setElement @$(selector).render()

  # NOOP will be overriden
  postInitialize: ->
    @log 'postInitialize'

  # NOOP will be overriden
  postRender: ->
    @log 'postRender'

  # Your bindings
  # NOOP will be overriden
  bindings: ->


    # To be called before view is thrown away.  Clean up intervals, events, etc.
    # NOOP will be overriden
  cleanup: ->
    @dispose()
    @remove()

  # Stole this method from Backbone v0.9.2 bleeding edge.
  # https://github.com/documentcloud/backbone/commit/3ae1af6df1b542bfb3e38f2fdfe7a471f2b830a0
  #
  # Clean up references to this view in order to prevent latent effects and
  # memory leaks.
  dispose: ->
    @undelegateEvents()
    @model.off null, null, this  if @model
    @collection.off null, null, this  if @collection
    this

  # A way to grab elements from the DOM using data-attributes.
  # Caches els by default. Pass `true` for `fresh` to ignore cache.
  $get: (key, fresh) ->
    @_$getEls = @_$getEls or {}
    @_$getEls[key] = @$("[data-" + key + "]")  if fresh or not @_$getEls[key]
    @_$getEls[key]

  log: (msg) ->
    console.log msg
