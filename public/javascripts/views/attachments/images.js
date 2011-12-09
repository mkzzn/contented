jQuery(function($) {
  $("button.add_image").click(function(event) {
    event.stopPropagation();
    event.preventDefault();
    var body = $("#article_body").val();
    var imageText = "![Alt Text](" + $(this).attr("url") + " \"Optional Title\")";
    $("#article_body").val(body + " " + imageText);
  });
});
