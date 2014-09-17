// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//# require turbolinks
//= require fullcalendar
//= require_tree .
$(document).ready(function(){
 $('#calendar').fullCalendar({
          editable: true,
          header: {
              left: 'prev,next today',
              center: 'title',
              right: 'month,agendaWeek,agendaDay'
          },
          defaultView: 'agendaWeek',
      });

 
 var date = new Date();
			var d = date.getDate();
			var m = date.getMonth();
			var y = date.getFullYear();

			$('#calendar_jdsaj').fullCalendar({
				header: {
					left: 'prev,next today',
					center: 'title',
					right: 'month,agendaWeek,agendaDay'
				},
				editable: false,
				    events: {
						  url: '/events',
						  type: 'GET',
						  error: function() {
						      alert('there was an error while fetching events!');
						  },
						  backgroundColor: 'blue',
						  textColor: 'black'
					}
			});
});

