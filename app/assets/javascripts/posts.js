$( document ).ready(function() {
  $('.new-comment').on('keydown', function(event) {
    if (event.keyCode == 13) {
      $(this).parent().parent().find('.create-comment-button').click();
    };
  });
});
