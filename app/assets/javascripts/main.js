$(document).ready(function(){

// modal window for logging in
  $('.log_in').avgrund({
    'template': $("#log_in"),
      width: 380,
      height: 300
  });

// modal window for editting profile
  $('.edit_profile_button').avgrund({
    'template': $('#user_edit'),
      height: 350,
      width: 640
  });

  $(".change_password").avgrund({
    'template': $("#change_password"),
      height: 350,
  })

// modal window for editting the accepted challenge
  $('.edit_accepted_challenge_button').avgrund({
    onLoad: function (element) {
        $('body').scrollTop(0)
    },
    'template': $('#accepted_challenge_edit'),
    width: 500,
    height: 310
  });

// modal window for signing up
  $('.sign_up_button').avgrund({
    'template': $('#sign_up'),
      height: 180
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
      $('#accept_challenge_button').append("<p class='this_challenge_accomplishe'>Accepted</p>")
    })
   })

//// User accomplished the challenge - modal window to provide prood and add a comment
  $('.this_challenge_accomplished').avgrund({
    onLoad: function (element) {
        $('body').scrollTop(0)
    },
    'template': $('#user_accomplished_challenge'),
      width: 500,
      height: 290
  })

   $(".checkbox").change(function(){
    if($(".private_section").is(':visible')){
      $(".private_section").hide()
    } else {
      $(".private_section").show()
    }
   })

   $(".proof_checkbox").change(function(){
    if($(".proof_required").is(':visible')){
      $(".proof_required").hide()
    } else {
      $(".proof_required").show()
    }
   })

//Adding comments
  $(".submit_comment").on("click", function(event){
      event.preventDefault();
     var userId = $(".user_challenge").data("currentUser");
     var body = $("#comment").val()
     var commentableType = $(".user_challenge").data("commentableType")
     var challengeId = $(".user_challenge").data("challengeId");
     var acceptedChallengeId = $(".user_challenge").data("acceptedChallenge")
     var commentableId;
      if(typeof challengeId !== 'undefined') {
        commentableId = challengeId
      } else {
        commentableId = acceptedChallengeId
      }
     $.ajax({
      url:'/comments',
      type: 'POST',
      data: {
        user_id: userId,
        body: body,
        commentable_type: commentableType,
        commentable_id: commentableId,

      }
    }).done(function(response){
      console.log(response)
      var comment = $("<p><span>"+ response.user + "</span> <span>" + response.comment + "</span></p>");
      $(".comments").append(comment)
      })

  })
})



