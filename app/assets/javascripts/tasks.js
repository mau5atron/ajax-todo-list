// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('turbolinks:load', function() {
	// jquery checks to see when turbolinks fully load then a function is executed
  console.log('document is ready!', new Date()); // this logging is optional
  $('#task_name').focus();



  $('.modal-footer .btn-primary').click(function() {
    $('.modal-body form').submit();
  }); 
});