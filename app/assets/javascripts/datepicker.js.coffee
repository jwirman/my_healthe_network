namespace 'Medlist', (exports) ->

  exports.datePicker = ->
    $(".datepicker").datepicker
      dateFormat: "yy-mm-dd"
      showOn: "both"
      buttonImageOnly: true
      buttonImage: image_path("calendar.gif")
