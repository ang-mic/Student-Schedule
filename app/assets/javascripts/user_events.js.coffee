# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
	$('#user_event_date').datepicker({
		dateFormat: 'yy-mm-dd'
	});
jQuery ->
	$('#user_event_start_at').timepicker({
		dateFormat: 'yy-mm-dd'
	});

jQuery ->
	$('#user_event_end_at').timepicker({
		dateFormat: 'yy-mm-dd'
	});

jQuery ->
	 $("#user_event_colour").minicolors()
