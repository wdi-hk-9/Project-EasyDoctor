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

    $.ajax({
      method: "POST",
      url: "/users/"+ window.location.pathname.split('/')[2] +"/appointments",
      data: {
        appointment: {
          datetime: datetime
        }
      },
      success: function (response) {
        window.location = "/users/appointments";
      }
    })
  });
})
