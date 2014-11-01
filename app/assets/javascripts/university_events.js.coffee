# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
	$('#university_event_date').datepicker({
		dateFormat: 'yy-mm-dd'
	});
jQuery ->
	$('#university_event_start_at').timepicker({
		dateFormat: 'yy-mm-dd'
	});

jQuery ->
	$('#university_event_end_at').timepicker({
		dateFormat: 'yy-mm-dd'
	});

jQuery ->
	 $('#university_event_colour').minicolors()