namespace 'Medlist', (exports) ->

  class exports.CustomFrequency
    constructor: (options) ->
      @id             = options.id
      @freqSelect     = $('[id$=users_med_freq]')
      @secondDose     = $('div.users_med_second_dose')
      @thirdDose      = $('div.users_med_third_dose')
      @fourthDose     = $('div.users_med_fourth_dose')
      @fifthDose      = $('div.users_med_fifth_dose')
      @sixthDose      = $('div.users_med_sixth_dose')
      @init()

    init: ->
      @updateUnits()
      @freqSelect.change =>
        @updateUnits()
        @updateDoses()

    updateUnits: ->
      $.ajax
        url: "/frequency_units"
        data:
          id: @id
          freq: @freqSelect.val()
        dataType: "script"

    updateDoses: ->
      if m = @freqSelect.val().match(/daily/)
        num = parseInt(m.input.match(/\d/)[0])
        @toggleDoses(num)
      else
        @toggleDoses(1)

    toggleDoses: (number) ->
      #console.log number
      switch number
        when 1
          @secondDose.hide()
          @thirdDose.hide()
          @fourthDose.hide()
          @fifthDose.hide()
          @sixthDose.hide()
        when 2
          @secondDose.show()
          @thirdDose.hide()
          @fourthDose.hide()
          @fifthDose.hide()
          @sixthDose.hide()
        when 3
          @secondDose.show()
          @thirdDose.show()
          @fourthDose.hide()
          @fifthDose.hide()
          @sixthDose.hide()
        when 4
          @secondDose.show()
          @thirdDose.show()
          @fourthDose.show()
          @fifthDose.hide()
          @sixthDose.hide()
        when 5
          @secondDose.show()
          @thirdDose.show()
          @fourthDose.show()
          @fifthDose.show()
          @sixthDose.hide()
        when 6
          @secondDose.show()
          @thirdDose.show()
          @fourthDose.show()
          @fifthDose.show()
          @sixthDose.show()
