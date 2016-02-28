class SelectBox
  constructor: (element)->
    @select = element
    @_initSelect()

  _initSelect: () ->
    @select.selectize
      sortField: 'text'

CURRENCY_SELECT = $(".new-invoice__currency-input")

if CURRENCY_SELECT.length
  window.App.SelectBox = new SelectBox(CURRENCY_SELECT)
