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
//= require_tree .


$(document).ready(function() {
    $('#calendar').fullCalendar({
        googleCalendarApiKey: 'AIzaSyCpsNSu1HKCXGxYGN8k88rTiAYRjau_Ckw',
        events: {
            // googleCalendarId: '8ts0o3q0tuabk57ikucbusg6jc@group.calendar.google.com',
            color: 'blue',   // an option!
            textColor: 'white'        }
    });
});
