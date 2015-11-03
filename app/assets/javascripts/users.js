$(function(){
  var updateViews = function(e) {
    var is_doctor = $('#user_select').val() == "true";

    if (is_doctor) {
      $('.doctors').show('slow');
    } else {
      $('.doctors').hide('slow');
    }
  }

  $('.doctors').hide();

  // $('#user_select').on('change', updateViews);
  $('#user_select').on('change', updateViews);
})
