class MaskMoney
  constructor: (element)->
    @select = element
    @_initMaskMoney()

  _initMaskMoney: () ->
    @select.maskMoney
      thousands: ''

PRICE_INPUT = $("#invoice_price_cents")

if PRICE_INPUT.length
  window.App.MaskMoney = new MaskMoney(PRICE_INPUT)
