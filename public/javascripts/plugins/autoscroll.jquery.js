;(function($) {
  $.fn.autoScroll = function(options) {
    
    // build main options before element iteration
    defaults = {"orientation":"top", "position":"absolute"};
    var $settings = $.extend({}, defaults, options);
    
    // iterate and reformat each matched element
    return this.each(function() {
      $(this)
        .css($settings["orientation"], $(window).scrollTop())
        .css("position", $settings["position"]);
    });
  }
})(jQuery);
