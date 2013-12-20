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
        header:
          left: 'prev,next today'
          center: 'title'
          right: 'month,agendaWeek,agendaDay'
        editable: true

        events: (start, end, callback) ->
          # get new events for the calendar
          $.ajax
            url: "generate_calendar_events"
            dataType: 'json'
            data:
              start: start.toDateString()
            success: (returned_data) ->
              callback returned_data

        eventClick: (calEvent, jsEvent, view) ->
          window.location = "users_meds/#{calEvent.id}/edit"

        eventDrop: (event, dayDelta, minuteDelta, allDay, revertFunc) ->
          alert event.title + " was moved " + dayDelta + " days and " + minuteDelta + " minutes."
          revertFunc() unless confirm("Are you sure about this change?")
