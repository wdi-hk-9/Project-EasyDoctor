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
    var hour;
    var min;
    var datetime = new Date(year, month, day, hour, min)

    console.log(datetime)
    $.ajax({
      method: "POST",
      url: "/appointment",
      data: {
        appointment: {
          datetime: datetime
        }
      }
    })
  });
})
