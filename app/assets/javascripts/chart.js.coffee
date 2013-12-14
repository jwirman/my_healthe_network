namespace 'Chart', (exports) ->

  class exports.CalendarView
    constructor: ->
      @calendarDiv      = $('#calendar')
      @init()

    init: ->
      @loadCalendar()

    loadCalendar: ->
      @calendarDiv.fullCalendar
        height: 650
        weekends: true
        editable: true

        #events: (start, end, callback) ->
        #  # get new events for the calendar
        #  $.ajax
        #    url: "site/generate_calendar_events"
        #    dataType: 'json'
        #    data:
        #      start: start.toDateString()
        #    success: (returned_data) ->
        #      callback returned_data

        #eventClick: (calEvent, jsEvent, view) ->
        #  if calEvent.client_id?
        #    window.location = "clients/#{calEvent.client_id}/reconciliations/#{calEvent.id}/edit"
        #  else
        #    window.location = "events/#{calEvent.id}/edit"

        #eventDrop: (event, dayDelta, minuteDelta, allDay, revertFunc) ->
        #  #alert event.title + " was moved " + dayDelta + " days and " + minuteDelta + " minutes."
        #  revertFunc() unless confirm("Are you sure about this change?")
        #  # still need to make ajax call and set pending_data_entry_date or 
        #  # pending_final_review_date based on type of event...
        #  # want to verify this is ok first with client :)
