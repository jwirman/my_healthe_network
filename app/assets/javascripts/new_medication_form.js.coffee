namespace 'Medlist', (exports) ->

  class exports.CustomFrequency
    constructor: ->
      @freqSelect     = $('#users_med_freq')
      @freqUnitSelect = $('#users_med_freq_unit')
      @secondDose     = $('div.users_med_second_dose')
      @thirdDose      = $('div.users_med_third_dose')
      @fourthDose     = $('div.users_med_fourth_dose')
      @fifthDose      = $('div.users_med_fifth_dose')
      @sixthDose      = $('div.users_med_sixth_dose')
      @init()

    init: ->
      @updateUnits()
      @checkForDailyAndUpdateDoses()
      @freqSelect.change =>
        @updateUnits()
        @updateDoses()
      @freqUnitSelect.change =>
        @checkForDailyAndUpdateDoses()

    updateUnits: ->
      $.ajax
        url: "/frequency_units"
        data:
          freq: @freqSelect.val()
        dataType: "script"

    updateDoses: ->
      if m = @freqSelect.val().match(/time/)
        num = parseInt(m.input.match(/\d/)[0])
        @toggleDoses(num)
      else
        @toggleDoses(1)

    checkForDailyAndUpdateDoses: ->
      if (@freqUnitSelect.val() == 'daily')
        @updateDoses()
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
