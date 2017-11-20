// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require moment
//= require fullcalendar
//= require fullcalendar/gcal
//= require rails-ujs
//= require chosen-jquery
//= require_tree .





$(document).ready(function(){
    $('.chosen-select').chosen({width: '500px'});
  });
  





$(document).ready(function() {
    $('#calendar').fullCalendar({
        googleCalendarApiKey: 'AIzaSyCpsNSu1HKCXGxYGN8k88rTiAYRjau_Ckw',
        eventSources:[ {
            googleCalendarId: '8ts0o3q0tuabk57ikucbusg6jc@group.calendar.google.com'

          },
              {
            url:'http://localhost:3000/api/v1/events'
                 }
               ]
    });

    $('#myModal').on('shown.bs.modal', function () {
      $('#myInput').focus()
    })
    

    $('.chosen-select').chosen({width: '500px'});
});
