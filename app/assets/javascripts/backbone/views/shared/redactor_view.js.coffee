class Totem.Views.RedactorView extends Totem.Views.BaseView

  el: '#totem'

  initialize: (options) ->
    super
    @$el.redactor(fixed: true, fixedBox: true, focus: true, autoresize: false)