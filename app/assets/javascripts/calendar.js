$(document).on('ready page:change', function() {

	var Icalendar = $('.calendar');
	var teacherId = Icalendar && Icalendar.data('teacher-id');

	function generateCalendar(){
		Icalendar.fullCalendar({
			header: {
					left: 'prev next',
					center: 'title',
					right: 'today' 
				},

				defaultView: "agendaWeek",
				contentHeight: "auto",

				eventSources: [
					{
						url: '/teachers/' + teacherId + '/availabilities',
						rendering: 'background',
						className: 'availability-color',
						// editable: true, 
					},
					{
						url: '/teachers/' + teacherId + '/bookings',
						backgroundColor: '#9DD6F2',
						className: 'booking-color'
					}
				],
		});
	}	
generateCalendar();
});


