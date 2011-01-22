;(function($) {
  $.fn.autoFade = function(options) {
    
    // build main options before element iteration
    defaults = {"delay":1800, "fade":1200};
    var $settings = $.extend({}, defaults, options);
    
    // iterate and reformat each matched element
    return this.each(function() {
      $(this).delay($settings["delay"]).fadeOut($settings["fade"], function() {
        $(this).remove();
      });
    });
  }
})(jQuery);
