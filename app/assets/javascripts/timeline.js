$(document).ready(function () {

  var labelTestData = [];

  var width = 800;
  var tripId = $(".timeline-data").attr("id");
  const URL = "http://localhost:3000/trips/" + tripId

  function timelineHover() {
    var chart = d3.timeline()
      .width(width*2)
      .itemHeight(20)
      .stack()
      .margin({left:70, right:30, top:0, bottom:0})
      // .hover(function (d, i, datum) {
      // // d is the current rendering object
      // // i is the index during d3 rendering
      // // datum is the id object
      //   var div = $('#hoverRes');
      //   var colors = chart.colors();
      //   div.find('.coloredDiv').css('background-color', colors(i))
      //   div.find('#name').text(datum.label + ": " + d.label);
      // })
      .click(function (d, i, datum) {
        console.log(datum);
        console.log(d.id);
        // window.location.href = URL + "/events/" + d.id;
        navigateToEvent(d);
      });
      // .scroll(function (x, scale) {
      //   $("#scrolled_date").text(scale.invert(x) + " to " + scale.invert(x+width));
      // });

    var svg = d3.select("#timeline3")
      .append("svg")
      .attr("width", width)
      .datum(labelTestData)
      .call(chart);
  }

  function loadDataFromServer() {
    $.ajax({
      url: URL + "/json",
      dataType: 'json',
      success: function(data) {
        labelTestData = data;
        timelineHover();
      }.bind(this),      // makes sure 'this' continues to be the correct object inside the callback
      error: function(xhr, status, err) {
        console.error(URL, status, err.toString());
      }.bind(this)
    });
  }

  function navigateToEvent(event_data) {
    query = $.param(event_data)
    console.log(query);
    $.ajax({
      url: URL + "/find_event",
      data: query,
      success: function(response) {
        console.log(response);
        $('#event-details').html(response);
      }.bind(this),      // makes sure 'this' continues to be the correct object inside the callback
      error: function(xhr, status, err) {
        console.error(URL, status, err.toString());
      }.bind(this)
    });
  }

  loadDataFromServer();

});
