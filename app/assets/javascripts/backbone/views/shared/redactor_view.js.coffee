class Totem.Views.RedactorView extends Totem.Views.BaseView

  el: '#totem'

  initialize: (options) ->
    super
    @$el.redactor(focus: true, autoresize: false)