# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  Morris.Line
    element: 'cycle_chart'
    data: $('#cycle_chart').data('days')
#    data: [
#      {date: '2012-12-05', temperature: 39},
#      {date: '2012-12-06', temperature: 200},
#      {date: '2012-12-07', temperature: 39.5},
#    ]
    xkey: 'date'
    ykeys: ['temperature']
    xLabels: 'day'
#    dateFormat: (x) ->
#      new Date(x).getDate()
    xLabelFormat: (x) ->
      x.getDate()
    labels: ['Temperature']
    smooth: false
