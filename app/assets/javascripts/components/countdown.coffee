window.App ||= {}

class Countdown
  constructor: (element, validTill)->
    @clock = element
    @validTill = validTill
    @_initCountdown()

  _initCountdown: () ->
    @clock.countdown @validTill, (event) ->
      $(@).html(event.strftime("Valid for: %M:%S"))

CLOCK = $(".countdown__timer")

if CLOCK.length
  validTill = CLOCK.attr("data-valid-till")
  window.App.Countdown = new Countdown(CLOCK, validTill)
