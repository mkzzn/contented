jQuery(function($) {

  $("#error_explanation, #errorExplanation, .flash")
    .autoFade({"delay": 2400})
    .autoScroll();

  $(window).scroll(function() {
    $("#error_explanation, #errorExplanation, .flash").autoScroll();
  });

});
