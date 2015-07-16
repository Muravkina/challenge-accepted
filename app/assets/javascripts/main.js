$(document).ready(function(){

// modal window for logging in
  $('.log_in').avgrund({
    'template': $("#log_in")
  });

// modal window for editting profile
  $('.edit_profile_button').avgrund({
    'template': $('#user_edit')
  });

// modal window for editting the accepted challenge
  $('.edit_accepted_challenge_button').avgrund({
    onLoad: function (element) {
        $('body').scrollTop(0)
    },
    'template': $('#accepted_challenge_edit')
  });

// modal window for signing up
  $('.sign_up_button').avgrund({
    'template': $('#sign_up')
  })

// AJAX to accepted_challenges#create - user accepts the challege
  $('.accept_challenge_button').on('click', function(){
    var userId = $(".user_challenge").data("userId");
    var challengeId = $(".user_challenge").data("challengeId");
    $.ajax({
      url:'/accepted_challenges',
      type: 'POST',
      data: {
        user_id: userId,
        challenge_id: challengeId
      }
    }).done(function(response){
      console.log(response)
      $('.accept_challenge_button').hide()
      $('#accept_challenge_button').append("<p>Accepted</p>")
    })
   })

//// User accomplished the challenge - modal window to provide prood and add a comment
  $('.this_challenge_accomplished').avgrund({
    onLoad: function (element) {
        $('body').scrollTop(0)
    },
    'template': $('#user_accomplished_challenge')
  })

   $(".checkbox").change(function(){
    if($(".private_section").is(':visible')){
      $(".private_section").hide()
    } else {
      $(".private_section").show()
    }
   })

})
