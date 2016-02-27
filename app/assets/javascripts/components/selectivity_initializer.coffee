class SelectivityInitializer
  constructor: (element)->
    @select = element
    @_initSelect()

  _initSelect: () ->
    @select.selectivity
      allowClear: true
      showSearchInputInDropdown: false

CURRENCY_SELECT = $(".new-invoice__currency-input")

if CURRENCY_SELECT.length
  window.App.Selectivity = new SelectivityInitializer(CURRENCY_SELECT)
