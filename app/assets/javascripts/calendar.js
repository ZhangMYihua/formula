$(document).on('ready page:change', function() {
var Icalendar = $('#calendar');
var teacherId = Icalendar && Icalendar.data('teacher-id');

Icalendar.fullCalendar({
	header: {
			left: 'prev next',
			center: 'title',
			right: 'today' 
		},
		eventSources: [
			{
				url: '/teachers/' + teacherId + '/availabilities',
				rendering: 'background',
				className: 'availability-color',
				// editable: true, 
			}]
});
});