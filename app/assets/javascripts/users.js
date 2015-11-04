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

    console.log(datetime)
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