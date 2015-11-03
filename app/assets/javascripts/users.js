// User Signup Form
$(document).ready(function(){
  var updateViews = function(e) {
    var is_doctor = $('#user_select').val() == "true";

    if (is_doctor) {
      $('.doctors').show('slow');
    } else {
      $('.doctors').hide('slow');
    }
  }

  updateViews();

  $('.doctors').hide();

  // $('#user_select').on('change', updateViews);
  $('#user_select').on('change', updateViews);
})

// User Dashboard
$(document).ready(function () {
  $('#make-appointment').show();
  $('#confirmed-appointments').hide();

  $('#show-appt').on('click', function(){
    $('#make-appointment').hide('slow');
    $('#confirmed-appointments').show('slow');
 });

  $('#add-appt').on('click', function(){
    $('#confirmed-appointments').hide('slow');
    $('#make-appointment').show('slow');
 });
})