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
  $('#user_select').on('change', updateViews);
})

// User Dashboard
$(document).ready(function () {
  $('#find-doc').show();
  $('#make-appointment').hide();
  $('#confirmed-appointments').hide();

  $('#find-doc').on('click', function(){
    $('#search-doc').show('slow');
    $('#make-appointment').hide('slow');
    $('#confirmed-appointments').hide('slow');
  });

  $('#show-appt').on('click', function(){
    $('#make-appointment').hide('slow');
    $('#search-doc').hide('slow');
    $('#confirmed-appointments').show('slow');
  });

  $('#add-appt').on('click', function(){
    $('#confirmed-appointments').hide('slow');
    $('#search-doc').hide('slow');
    $('#make-appointment').show('slow');
  });

  //Make Appointment

  $('#datepicker').datepicker();

  $('#send-request-form').on("submit", function(e){
    e.preventDefault();
    // ajax method
    var date = $('#datepicker').datepicker("getDate")
    var year = date.getFullYear();
    var month = date.getMonth();
    var day = date.getDate();
    var hour = Math.floor((parseInt($("#timeslot").val()))*0.5) + 10;
    var min = parseInt($("#timeslot").val()) % 2 == 0 ? 0 : 30;
    var datetime = new Date(year, month, day, hour, min);
    var doctor_id = $("#doctor-selection").val();

    $.ajax({
      method: "POST",
      url: "/appointments",
      data: {
        appointment: {
          datetime: datetime,
          doctor_id: doctor_id
        }
      }
    })
  });
})
