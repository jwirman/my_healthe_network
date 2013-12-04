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
      @updateDoses()

    updateUnits: ->
      @freqSelect.change =>
        $.ajax
          url: "/frequency_units"
          data:
            freq: @freqSelect.val()
          dataType: "script"

    updateDoses: ->
      @freqSelect.change =>
        if m = @freqSelect.val().match(/time/)
          num = m.input.substring(0,m.index).trim()
          @toggleDoses(num)
        else
          @toggleDoses('One')

      @freqUnitSelect.change =>
        if (@freqUnitSelect.val() == 'Daily') and (m = @freqSelect.val().match(/time/))
          num = m.input.substring(0,m.index).trim()
          @toggleDoses(num)
        else
          @toggleDoses('One')

    toggleDoses: (number) ->
      #console.log number
      switch number
        when 'One'
          @secondDose.hide()
          @thirdDose.hide()
          @fourthDose.hide()
          @fifthDose.hide()
          @sixthDose.hide()
        when 'Two'
          @secondDose.show()
          @thirdDose.hide()
          @fourthDose.hide()
          @fifthDose.hide()
          @sixthDose.hide()
        when 'Three'
          @secondDose.show()
          @thirdDose.show()
          @fourthDose.hide()
          @fifthDose.hide()
          @sixthDose.hide()
        when 'Four'
          @secondDose.show()
          @thirdDose.show()
          @fourthDose.show()
          @fifthDose.hide()
          @sixthDose.hide()
        when 'Five'
          @secondDose.show()
          @thirdDose.show()
          @fourthDose.show()
          @fifthDose.show()
          @sixthDose.hide()
        when 'Six'
          @secondDose.show()
          @thirdDose.show()
          @fourthDose.show()
          @fifthDose.show()
          @sixthDose.show()
