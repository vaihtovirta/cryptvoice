window.App ||= {}

class MaskMoney
  constructor: (element)->
    @input = element
    @_initMaskMoney()

  _initMaskMoney: () ->
    @input.maskMoney
      thousands: ''
    @input.maskMoney("mask")


PRICE_INPUT = $("#invoice_price")

if PRICE_INPUT.length
  window.App.MaskMoney = new MaskMoney(PRICE_INPUT)
