$ ->
  $('#users_med_freq').change ->
    $.ajax
      url: "/frequency_units"
      data:
        freq: $("#users_med_freq").val()
      dataType: "script"
