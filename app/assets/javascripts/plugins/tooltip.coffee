class Factual.Tooltip
  constructor: ->
    @$tooltips = $('[data-toggle="tooltip"]')
    @bind()

  bind: ->
    if @$tooltips.length > 0
      @$tooltips.tooltip()

$(document).on 'turbolinks:load', ->
  window.Factual.tooltip = new Factual.Tooltip()
